library(gofCopula)


### Name: gof
### Title: Combining function for tests
### Aliases: gof

### ** Examples

data(IndexReturns)

gof(IndexReturns[c(1:100),c(1:2)], priority = "tests", copula = "normal", 
tests = c("gofRosenblattSnB", "gofRosenblattSnC"), M = 10)



