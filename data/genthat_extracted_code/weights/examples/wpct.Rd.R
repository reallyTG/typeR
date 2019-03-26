library(weights)


### Name: wpct
### Title: Provides a weighted table of percentages for any variable.
### Aliases: wpct
### Keywords: ~frequency ~contingency ~weights ~tables

### ** Examples

test <- c(1,1,1,1,1,1,2,2,2,3,3,3,4,4)
weight <- c(.5,.5,.5,.5,.5,1,1,1,1,2,2,2,2,2)

wpct(test)
wpct(test, weight)



