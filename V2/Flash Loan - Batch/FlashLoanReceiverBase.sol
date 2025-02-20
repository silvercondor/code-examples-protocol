// SPDX-License-Identifier: agpl-3.0
pragma solidity >=0.6.12;

import {IFlashLoanReceiver, ILendingPoolAddressesProvider, ILendingPool, IERC20  } from "https://github.com/silvercondor/code-examples-protocol/blob/main/V2/Flash%20Loan%20-%20Batch/Interfaces.sol";
import { SafeERC20, SafeMath } from "https://github.com/silvercondor/code-examples-protocol/blob/main/V2/Flash%20Loan%20-%20Batch/Libraries.sol";

abstract contract FlashLoanReceiverBase is IFlashLoanReceiver {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  ILendingPoolAddressesProvider public immutable ADDRESSES_PROVIDER;
  ILendingPool public immutable LENDING_POOL;

  constructor(ILendingPoolAddressesProvider provider) {
    ADDRESSES_PROVIDER = provider;
    LENDING_POOL = ILendingPool(provider.getLendingPool());
  }
}