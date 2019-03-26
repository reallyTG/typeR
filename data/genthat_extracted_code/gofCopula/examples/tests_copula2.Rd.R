library(gofCopula)


### Name: gofRosenblattChisq
### Title: Gof test using the Anderson-Darling test statistic and the
###   chi-square distribution
### Aliases: gofRosenblattChisq

### ** Examples

data(IndexReturns)

gofRosenblattChisq("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



