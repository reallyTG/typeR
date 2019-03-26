library(mice)


### Name: cci
### Title: Complete case indicator
### Aliases: cci
### Keywords: univar

### ** Examples

cci(nhanes) # indicator for 13 complete cases 
cci(mice(nhanes, maxit = 0))
f <- cci(nhanes[,c("bmi","hyp")]) # complete data for bmi and hyp
nhanes[f,] # obtain all data from those with complete bmi and hyp



