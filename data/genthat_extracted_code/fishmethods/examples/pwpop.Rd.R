library(fishmethods)


### Name: pwpop
### Title: Estimate Net Reproductive Rates Over Multiple Periods Of An
###   Abundance Time Series Using Piecewise Regression
### Aliases: pwpop
### Keywords: misc

### ** Examples

data(counts)
pwpop(abund = counts$number, year = counts$year,periods = 3, Cs = c(2000,2005), 
startR = c(0.5,0.5,0.5), 
upperR = c(10,10,10), 
lowerR = c(-10,-10,-10))



