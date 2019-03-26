library(fExoticOptions)


### Name: CurrencyTranslatedOptions
### Title: Valuation of Currency Translated Options
### Aliases: CurrencyTranslatedOptions FEInDomesticFXOption QuantoOption
###   EquityLinkedFXOption TakeoverFXOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.13 in E.G. Haug's Option Guide (1997)

## Foreign Equity Options Struck in Domestic Currency [2.13.1]:
   FEInDomesticFXOption(TypeFlag = "c", S = 100, E = 1.5, 
     X = 160, Time = 0.5, r = 0.08, q = 0.05, sigmaS = 0.20, 
     sigmaE = 0.12, rho = 0.45)

## Fixed Exchange-Rate Foreign-Equity Option [2.13.2]: 
   QuantoOption(TypeFlag = "c", S = 100, Ep = 1.5, X = 105, 
     Time = 0.5, r = 0.08, rf = 0.05, q = 0.04, sigmaS= 0.2, 
     sigmaE = 0.10, rho = 0.30) 

## Equity Linked Foreign Exchange Option [2.13.3]:
   EquityLinkedFXOption(TypeFlag = "p", E = 1.5, S = 100, 
     X = 1.52, Time = 0.25, r = 0.08, rf = 0.05, q = 0.04, 
     sigmaS = 0.20, sigmaE = 0.12, rho = -0.40)

## Takeover Foreign-Exchange Option [2.13.4]:
   TakeoverFXOption(V = 100, B = 100, E = 1.5, X = 1.55, Time = 1, 
     r = 0.08, rf = 0.06, sigmaV = 0.20, sigmaE = 0.25, rho = 0.1)




