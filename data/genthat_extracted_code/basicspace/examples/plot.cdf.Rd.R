library(basicspace)


### Name: plot.cdf
### Title: Aldrich-McKelvey Coordinate Cumulative Distribution Plot
### Aliases: plot.cdf
### Keywords: multivariate

### ** Examples

### Loads and scales the Liberal-Conservative scales from the 1980 NES.
data(LC1980)
result <- aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9),verbose=TRUE)

summary(result)
par(ask=TRUE)
plot.AM(result,xlim=c(-1.5,1.5))
plot.cdf(result)



