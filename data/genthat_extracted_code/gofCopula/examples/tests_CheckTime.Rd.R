library(gofCopula)


### Name: gofCheckTime
### Title: Combining function for tests
### Aliases: gofCheckTime

### ** Examples

data(IndexReturns)

gofCheckTime("normal", IndexReturns[c(1:50),c(1:2)], "gofRosenblattSnC", M = 10000)



