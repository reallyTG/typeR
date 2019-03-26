library(fExoticOptions)


### Name: MultipleAssetsOptions
### Title: Valuation of Mutiple Assets Options
### Aliases: MultipleAssetsOptions TwoAssetCorrelationOption
###   EuropeanExchangeOption AmericanExchangeOption
###   ExchangeOnExchangeOption TwoRiskyAssetsOption SpreadApproxOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.8 in E.G. Haug's Option Guide (1997)

## Two Asset Correlation Options [2.8.1]:
   TwoAssetCorrelationOption(TypeFlag = "c", S1 = 52, S2 = 65, 
     X1 = 50, X2 = 70, Time = 0.5, r = 0.10, b1 = 0.10, b2 = 0.10, 
     sigma1 = 0.2, sigma2 = 0.3, rho = 0.75) 

## European Exchange Options [2.8.2]: 
   EuropeanExchangeOption(S1 = 22, S2 = 0.20, Q1 = 1, Q2 = 1, 
     Time = 0.1, r = 0.1, b1 = 0.04, b2 = 0.06, sigma1 = 0.2, 
     sigma2 = 0.25, rho = -0.5)
     
## American Exchange Options [2.8.2]:
   AmericanExchangeOption(S1 = 22, S2 = 0.20, Q1 = 1, Q2 = 1, 
     Time = 0.1, r = 0.1, b1 = 0.04, b2 = 0.06, sigma1 = 0.2, 
     sigma2 = 0.25, rho = -0.5)

## Exchange Options On Exchange Options [2.8.3]:
   for (flag in 1:4) print(
   ExchangeOnExchangeOption(TypeFlag = as.character(flag), 
     S1 = 105, S2 = 100, Q = 0.1, time1 = 0.75, Time2 = 1.0, r = 0.1, 
     b1 = 0.10, b2 = 0.10, sigma1 = 0.20, sigma2 = 0.25, rho = -0.5))

## Two Risky Assets Options [2.8.4]:
   TwoRiskyAssetsOption(TypeFlag = "cmax", S1 = 100, S2 = 105, 
     X = 98, Time = 0.5, r = 0.05, b1 = -0.01, b2 = -0.04, 
     sigma1 = 0.11, sigma2 = 0.16, rho = 0.63)
   TwoRiskyAssetsOption(TypeFlag = "pmax", S1 = 100, S2 = 105, 
     X = 98, Time = 0.5, r = 0.05, b1 = -0.01, b2 = -0.04, 
     sigma1 = 0.11, sigma2 = 0.16, rho = 0.63)

## Spread-Option Approximation [2.8.5]:
   SpreadApproxOption(TypeFlag = "c", S1 = 28, S2 = 20, X = 7, 
     Time = 0.25, r = 0.05, sigma1 = 0.29, sigma2 = 0.36, rho = 0.42)
    



