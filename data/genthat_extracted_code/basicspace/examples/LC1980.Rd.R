library(basicspace)


### Name: LC1980
### Title: 1980 Liberal-Conservative Scales.
### Aliases: LC1980
### Keywords: datasets

### ** Examples

### Loads and scales the Liberal-Conservative scales from the 1980 NES.
data(LC1980)
result <- aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9),verbose=TRUE)
summary(result)
par(ask=TRUE)
plot.AM(result,xlim=c(-1.5,1.5))
plot.cdf(result)



