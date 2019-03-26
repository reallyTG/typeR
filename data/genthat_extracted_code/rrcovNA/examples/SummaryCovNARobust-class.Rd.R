library(rrcovNA)


### Name: SummaryCovNARobust-class
### Title: Class "SummaryCovNARobust" - summary of "CovNARobust" objects
### Aliases: SummaryCovNARobust-class show,SummaryCovNARobust-method
### Keywords: classes robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cv <- CovMest(hbk.x)
cv
summary(cv)



