library(fOptions)


### Name: BasicAmericanOptions
### Title: Valuation of Basic American Options
### Aliases: BasicAmericanOptions RollGeskeWhaleyOption
###   BAWAmericanApproxOption BSAmericanApproxOption
### Keywords: math

### ** Examples

## All the examples are from Haug's Option Guide (1997)

## CHAPTER 1.4: ANALYTICAL MODELS FOR AMERICAN OPTIONS
       
## Roll-Geske-Whaley American Calls on Dividend Paying 
   # Stocks [Haug 1.4.1]
   RollGeskeWhaleyOption(S = 80, X = 82, time1 = 1/4, 
     Time2 = 1/3, r = 0.06, D = 4, sigma = 0.30)
      
## Barone-Adesi and Whaley Approximation for American 
   # Options [Haug 1.4.2] vs. Black76 Option on Futures:
   BAWAmericanApproxOption(TypeFlag = "p", S = 100, 
     X = 100, Time = 0.5, r = 0.10, b = 0, sigma = 0.25)
   Black76Option(TypeFlag = "c", FT = 100, X = 100, 
     Time = 0.5, r = 0.10, sigma = 0.25)  
     
## Bjerksund and Stensland Approximation for American Options:
   BSAmericanApproxOption(TypeFlag = "c", S = 42, X = 40, 
     Time = 0.75, r = 0.04, b = 0.04-0.08, sigma = 0.35)



