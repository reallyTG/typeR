library(basicspace)


### Name: summary.aldmck
### Title: Aldrich-McKelvey Summary
### Aliases: summary.aldmck
### Keywords: multivariate

### ** Examples

data(LC1980)
result <- aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9),verbose=TRUE)
summary(result)
par(ask=TRUE)
plot.AM(result,xlim=c(-1.5,1.5))
plot.cdf(result)



