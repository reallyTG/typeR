library(fOptions)


### Name: PlainVanillaOptions
### Title: Valuation of Plain Vanilla Options
### Aliases: PlainVanillaOptions fOPTION fOPTION-class GBSOption
###   GBSCharacteristics BlackScholesOption GBSGreeks GBSVolatility
###   Black76Option MiltersenSchwartzOption NDF CND CBND print.option
###   summary.option show,fOPTION-method summary.fOPTION
### Keywords: math

### ** Examples

## All the examples are from Haug's Option Guide (1997)

## CHAPTER 1.1: ANALYTICAL FORMULAS FOR EUROPEAN OPTIONS:

## Black Scholes Option [Haug 1.1.1]
   GBSOption(TypeFlag = "c", S = 60, X = 65, Time = 1/4, r = 0.08,
     b = 0.08, sigma = 0.30)

## European Option on a Stock with Cash Dividends [Haug 1.1.2]
   S0  =  100; r  =  0.10; D1  =  D2  =  2; t1  =  1/4; t2  =  1/2
   S  =  S0 - 2*exp(-r*t1) - 2*exp(-r*t2)
   GBSOption(TypeFlag = "c", S = S, X = 90, Time = 3/4, r = r, b = r,
     sigma = 0.25)

## Options on Stock Indexes [Haug 1.2.3]
   GBSOption(TypeFlag = "p", S = 100, X = 95, Time = 1/2, r = 0.10,
     b = 0.10-0.05, sigma = 0.20)

## Option on Futures [Haug 1.1.4]
   FuturesPrice  =  19
   GBSOption(TypeFlag = "c", S = FuturesPrice, X = 19, Time = 3/4,
     r = 0.10, b = 0, sigma = 0.28)

## Currency Option [Haug 1.1.5]
   r  =  0.06; rf  =  0.08
   GBSOption(TypeFlag = "c", S = 1.5600, X = 1.6000,
     Time = 1/2, r = 0.06, b = 0.06-0.08, sigma = 0.12)

## Delta of GBS Option [Haug 1.3.1]
   GBSGreeks(Selection = "delta", TypeFlag = "c", S = 105, X = 100,
     Time = 1/2, r = 0.10, b = 0, sigma = 0.36)

## Gamma of GBS Option [Haug 1.3.3]
   GBSGreeks(Selection = "gamma", TypeFlag = "c", S = 55, X = 60,
     Time = 0.75, r = 0.10, b = 0.10, sigma = 0.30)

## Vega of GBS Option [Haug 1.3.4]
   GBSGreeks(Selection = "vega", TypeFlag = "c", S = 55, X = 60,
     Time = 0.75, r = 0.10, b = 0.10, sigma = 0.30)

## Theta of GBS Option [Haug 1.3.5]
    GBSGreeks(Selection = "theta", TypeFlag = "p", S = 430, X = 405,
     Time = 0.0833, r = 0.07, b = 0.07-0.05, sigma = 0.20)

## Rho of GBS Option [Haug 1.3.5]
   GBSGreeks(Selection = "rho", TypeFlag = "c", S = 72, X = 75,
     Time = 1, r = 0.09, b = 0.09, sigma = 0.19)

## CHAPTER 1.3 OPTIONS SENSITIVITIES:

## The Generalized Black Scholes Option Formula
   GBSCharacteristics(TypeFlag = "p", S = 1.5600, X = 1.6000,
     Time = 1, r = 0.09, b = 0.09, sigma = 0.19)

## CHAPTER 1.5: RECENT DEVELOPMENTS IN COMMODITY OPTIONS

## Miltersen Schwartz Option vs. Black76 Option on Futures:
   MiltersenSchwartzOption(TypeFlag = "c", Pt = exp(-0.05/4), FT = 95,
     X = 80, time = 1/4, Time = 1/2, sigmaS = 0.2660, sigmaE = 0.2490,
     sigmaF = 0.0096, rhoSE = 0.805, rhoSF = 0.0805, rhoEF = 0.1243,
     KappaE = 1.045, KappaF = 0.200)
   Black76Option(TypeFlag = "c", FT = 95, X = 80, Time = 1/2, r = 0.05,
     sigma = 0.266)




