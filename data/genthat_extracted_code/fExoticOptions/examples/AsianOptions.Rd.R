library(fExoticOptions)


### Name: AsianOptions
### Title: Valuation of Asian Options
### Aliases: AsianOptions GeometricAverageRateOption
###   TurnbullWakemanAsianApproxOption LevyAsianApproxOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.12 in E.G. Haug's Option Guide (1997)

## Geometric Average Rate Option:
   GeometricAverageRateOption(TypeFlag = "p", S = 80, X = 85, 
     Time = 0.25, r = 0.05, b = 0.08, sigma = 0.20)

## Turnbull Wakeman Approximation:
   TurnbullWakemanAsianApproxOption(TypeFlag = "p", S = 90, SA = 88, 
     X = 95, Time = 0.50, time = 0.25, tau = 0.0, r = 0.07, 
     b = 0.02, sigma = 0.25)

## Levy Asian Approximation:   
   LevyAsianApproxOption(TypeFlag = "c", S = 100, SA = 100, X = 105, 
     Time = 0.75, time = 0.50, r = 0.10, b = 0.05, sigma = 0.15)
     



