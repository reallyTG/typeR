library(fExoticOptions)


### Name: MultipleExercisesOptions
### Title: Valuation of Mutiple Exercises Options
### Aliases: MultipleExercisesOptions ExecutiveStockOption
###   ForwardStartOption RatchetOption TimeSwitchOption SimpleChooserOption
###   ComplexChooserOption OptionOnOption WriterExtendibleOption
###   HolderExtendibleOption
### Keywords: math

### ** Examples

## Examples from Chapter 2.1 - 2.7 in E.G. Haug's Option Guide (1997)

## ExecutiveStockOption [2.1]:
   ExecutiveStockOption(TypeFlag = "c", S = 60, X = 64, Time = 2, 
    r = 0.07, b = 0.07-0.03, sigma = 0.38, lambda = 0.15) 
    
## ForwardStartOption [2.2]:
   ForwardStartOption(TypeFlag = "c", S = 60, alpha = 1.1, 
     time1 = 1, Time2 = 1/4, r = 0.08, b = 0.08-0.04, sigma = 0.30)
     
## Ratchet Option [2.3]:
   RatchetOption(TypeFlag = "c", S = 60, alpha = 1.1, time1 = c(1.00, 0.75), 
     Time2 = c(0.75, 0.50), r = 0.08, b = 0.04, sigma = 0.30)
     
## Time Switch Option [2.4]:
   TimeSwitchOption(TypeFlag = "c", S = 100, X = 110, Time = 1, 
    r = 0.06, b = 0.06, sigma = 0.26, A = 5, m = 0, dt = 1/365)
    
## Simple Chooser Option [2.5.1]:
   SimpleChooserOption(S = 50, X = 50, time1 = 1/4, Time2 = 1/2, 
     r = 0.08, b = 0.08, sigma = 0.25)  
        
## Complex Chooser Option [2.5.2]:
   ComplexChooserOption(S = 50, Xc = 55, Xp = 48, Time = 0.25, 
     Timec = 0.50, Timep = 0.5833, r = 0.10, b = 0.1-0.05, 
     sigma = 0.35, doprint = TRUE)
     
## Option On Option [2.6]:
   OptionOnOption(TypeFlag = "pc", S = 500, X1 = 520, X2 = 50, 
     time1 = 1/2, Time2 = 1/4, r = 0.08, b = 0.08-0.03, sigma = 0.35)
    
## Holder Extendible Option [2.7.1]:
   HolderExtendibleOption(TypeFlag = "c", S = 100, X1 = 100, 
     X2 = 105, time1 = 0.50, Time2 = 0.75, r = 0.08, b = 0.08, 
     sigma = 0.25, A = 1)
     
## Writer Extendible Option [2.7.2]:
   WriterExtendibleOption(TypeFlag = "c", S = 80, X1 = 90, X2 = 82,
     time1 = 0.50, Time2 = 0.75, r = 0.10, b = 0.10, sigma = 0.30)
 



