library(fExoticOptions)


### Name: BarrierOptions
### Title: Valuation of Barrier Options
### Aliases: BarrierOptions StandardBarrierOption DoubleBarrierOption
###   PTSingleAssetBarrierOption TwoAssetBarrierOption
###   PTTwoAssetBarrierOption LookBarrierOption DiscreteBarrierOption
###   SoftBarrierOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.10 in E.G. Haug's Option Guide (1997)

## Standard Barrier Option [2.10.1]:
   # down-and-out Barrier Call
   StandardBarrierOption(TypeFlag = "cdo", S = 100, X = 90, 
     H = 95, K = 3, Time = 0.5, r = 0.08, b = 0.04, sigma = 0.25)
   
## Double Barrier Option [2.10.2]:
   DoubleBarrierOption(TypeFlag = "co", S = 100, X = 100, L = 50, 
     U = 150, Time = 0.25, r = 0.10, b = 0.10, sigma = 0.15, 
     delta1 = -0.1, delta2 = 0.1)
   
## Partial Time Single-Asset Barrier Option [2.10.3]:
   PTSingleAssetBarrierOption(TypeFlag = "coB1", S = 95, X = 110, 
     H = 100, time1 = 0.5, Time2 = 1, r = 0.20, b = 0.20, 
     sigma = 0.25)
   
## Two Asset Barrier Option [2.10.4]:
   TwoAssetBarrierOption(TypeFlag = "puo", S1 = 100, S2 = 100, 
     X = 110, H = 105, Time = 0.5, r = 0.08, b1 = 0.08, b2 = 0.08, 
     sigma1 = 0.2, sigma2 = 0.2, rho = -0.5)
   
## PT Two Asset Barrier Option [2.10.5]:
   PTTwoAssetBarrierOption(TypeFlag = "pdo", S1 = 100, S2 = 100, 
     X = 100, H = 85, time1 = 0.5, Time2 = 1, r = 0.1, b1 = 0.1, 
     b2 = 0.1, sigma1 = 0.25, sigma2 = 0.30, rho = -0.5)
   
## Look Barrier Option [2.10.6]:
   LookBarrierOption(TypeFlag = "cuo", S = 100, X = 100, H = 130, 
     time1 = 0.25, Time2 = 1, r = 0.1, b = 0.1, sigma = 0.15)
   LookBarrierOption(TypeFlag = "cuo", S = 100, X = 100, H = 110, 
     time1 = 1, Time2 = 1, r = 0.1, b = 0.1, sigma = 0.30)
   
## Discrete Barrier Option [2.10.7]:  
   DiscreteBarrierOption(S = 100, H = 105, sigma = 0.25, dt = 0.1)
   
## Soft Barrier Option [2.10.8]:
   SoftBarrierOption(TypeFlag = "cdo", S = 100, X = 100, L = 70, 
     U = 95, Time = 0.5, r = 0.1, b = 0.05, sigma = 0.20)
  



