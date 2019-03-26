library(devFunc)


### Name: checkRanges
### Title: Checking if the value of a numeric or integer variable (of
###   length 1) is located within a certain range.
### Aliases: checkRanges

### ** Examples

someValue <- 2
checkRanges(list(someValue), list(c('<', 3)))

## No test: 
someValue <- '2'
checkRanges(list(someValue), list(c('<', 3)))
checkRanges(list(someValue), list(c(1.5, 3)))
## End(No test)

someValue <- 6
someOtherValue <- 5
checkRanges(list(someValue, someOtherValue), list(c('>=', 2.5), c('>=', 2.5, '<=', 5)))
## No test: 
checkRanges(list(someValue, someOtherValue), list(c('>=', 2.5), c('>=', 2.5, '<', 5)))
checkRanges(list(someValue, someOtherValue), list(c('>=', 2.5, '<=', 5), c('>=', 2.5, '<', 5)))
## End(No test)



