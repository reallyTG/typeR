library(fExoticOptions)


### Name: LookbackOptions
### Title: Valuation of Lookback Options
### Aliases: LookbackOptions FloatingStrikeLookbackOption
###   FixedStrikeLookbackOption PTFloatingStrikeLookbackOption
###   PTFixedStrikeLookbackOption ExtremeSpreadOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.9 in E.G. Haug's Option Guide (1997)

## Floating Strike Lookback Option [2.9.1]:
   FloatingStrikeLookbackOption(TypeFlag = "c", S = 120, 
     SMinOrMax = 100, Time = 0.5, r = 0.10, b = 0.10-0.06, 
     sigma = 0.30)
  
## Fixed Strike Lookback Option [2.9.2]:
   FixedStrikeLookbackOption(TypeFlag = "c", S = 100, 
     SMinOrMax = 100, X = 105, Time = 0.5, r = 0.10, b = 0.10, 
     sigma = 0.30)
   
## Partial Time Floating Strike Lookback Option [2.9.3]:
   PTFloatingStrikeLookbackOption(TypeFlag = "p", S = 90, 
     SMinOrMax = 90, time1 = 0.5, Time2 = 1, r = 0.06, b = 0.06, 
     sigma = 0.20, lambda  = 1)
   
## Partial Time Fixed Strike Lookback Option [2.9.4]:
   PTFixedStrikeLookbackOption(TypeFlag = "c", S = 100, X = 90, 
     time1 = 0.5, Time2 = 1, r = 0.06, b = 0.06, sigma = 0.20)
     
## Extreme Spread Option [2.9.5]:
   ExtremeSpreadOption(TypeFlag = "c", S = 100, SMin = NA, 
     SMax = 110, time1 = 0.5, Time2 = 1, r = 0.1, b = 0.1, 
     sigma = 0.30)
   ExtremeSpreadOption(TypeFlag = "cr", S = 100, SMin = 90, 
     SMax = NA, time1 = 0.5, Time2 = 1, r = 0.1, b = 0.1, 
     sigma = 0.30)
        



