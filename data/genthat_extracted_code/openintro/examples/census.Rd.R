library(openintro)


### Name: census
### Title: Random sample of 2000 U.S. Census Data
### Aliases: census
### Keywords: datasets

### ** Examples

data(census)
str(census)
these <- census[,3] > 0     # income greater than 0
histPlot(log(census$totalFamilyIncome[these]), xlab="log(total family income)")



