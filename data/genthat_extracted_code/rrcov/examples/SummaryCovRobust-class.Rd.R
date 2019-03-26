library(rrcov)


### Name: SummaryCovRobust-class
### Title: Class "SummaryCovRobust" - summary of "CovRobust" objects
### Aliases: SummaryCovRobust-class isClassic,SummaryCovRobust-method
###   show,SummaryCovRobust-method
### Keywords: classes robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cv <- CovMest(hbk.x)
cv
summary(cv)



