library(fExoticOptions)


### Name: BinaryOptions
### Title: Valuation of Binary Options
### Aliases: BinaryOptions GapOption CashOrNothingOption
###   TwoAssetCashOrNothingOption AssetOrNothingOption SuperShareOption
###   BinaryBarrierOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.11 in E.G. Haug's Option Guide (1997)

## Gap Option [2.11.1]:
   GapOption(TypeFlag = "c", S = 50, X1 = 50, X2 = 57, Time = 0.5, 
     r = 0.09, b = 0.09, sigma = 0.20)

## Cash Or Nothing Option [2.11.2]:
   CashOrNothingOption(TypeFlag = "p", S = 100, X = 80, K = 10, 
     Time = 9/12, r = 0.06, b = 0, sigma = 0.35) 

## Two Asset Cash Or Nothing Option [2.11.3]:
   # Type 1 - call:
   TwoAssetCashOrNothingOption(TypeFlag = "c", S1 = 100, S2 = 100, 
     X1 = 110, X2 = 90, K = 10, Time = 0.5, r = 0.10, b1 = 0.05, 
     b2 = 0.06, sigma1 = 0.20, sigma2 = 0.25, rho = 0.5)
   # Type 2 - put:
   TwoAssetCashOrNothingOption(TypeFlag = "p", S1 = 100, S2 = 100, 
     X1 = 110, X2 = 90, K = 10, Time = 0.5, r = 0.10, b1 = 0.05, 
     b2 = 0.06, sigma1 = 0.20, sigma2 = 0.25, rho = -0.5)
   # Type 3 - down-up:
   TwoAssetCashOrNothingOption(TypeFlag = "ud", S1 = 100, S2 = 100, 
     X1 = 110, X2 = 90, K = 10, Time = 1, r = 0.10, b1 = 0.05, 
     b2 = 0.06, sigma1 = 0.20, sigma2 = 0.25, rho = 0)
   # Type 4 - up-down:
   TwoAssetCashOrNothingOption(TypeFlag = "du", S1 = 100, S2 = 100, 
     X1 = 110, X2 = 90, K = 10, Time = 1, r = 0.10, b1 = 0.05, 
     b2 = 0.06, sigma1 = 0.20, sigma2 = 0.25, rho = 0)

## Asset Or Nothing Option [2.11.4]: 
   AssetOrNothingOption(TypeFlag = "p", S = 70, X = 65, Time = 0.5, 
     r = 0.07, b = 0.07 - 0.05, sigma = 0.27)

## Super Share Option [2.11.5]:  
   SuperShareOption(S = 100, XL = 90, XH = 110, Time = 0.25, r = 0.10, 
     b = 0, sigma = 0.20)

## Binary Barrier Option [2.11.6]: 
   BinaryBarrierOption(TypeFlag = "6", S = 95, X=102, H = 100, 
     K = 15, Time = 0.5, r = 0.1, b = 0.1, sigma = 0.20)
   BinaryBarrierOption(TypeFlag = "12", S = 95, X = 98, H = 100, 
     K = 15, Time = 0.5, r = 0.1, b = 0.1, sigma = 0.20)
     



