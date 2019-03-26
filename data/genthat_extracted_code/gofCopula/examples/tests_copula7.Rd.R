library(gofCopula)


### Name: gofRosenblattGamma
### Title: Gof test using the Anderson-Darling test statistic and the gamma
###   distribution
### Aliases: gofRosenblattGamma

### ** Examples

data(IndexReturns)

gofRosenblattGamma("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



