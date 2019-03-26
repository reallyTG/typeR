library(berryFunctions)


### Name: ci
### Title: calculate confidence interval around mean
### Aliases: ci
### Keywords: htest

### ** Examples


yourdata <- c(5:8,3,14)
ci(yourdata)          # confidence interval with the default confidence level (95%)
ci(yourdata, 0.99)    # specified with a different confidence level
ci(yourdata, 0.99, 4) # returns 4 decimal places
ci(yourdata,,2)       # rounds to 2 decimal places with default level
ci(yourdata)[1,1]     # returns lower boundary of the interval as a numeric
ci(yourdata)[1,2]     # returns upper boundary of the interval as a numeric
ci                    # shows the function itself




