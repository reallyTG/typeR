library(basicspace)


### Name: colombia
### Title: 2004 PELA Liberal-Conservative Scales.
### Aliases: colombia
### Keywords: datasets

### ** Examples

### Loads and scales the Liberal-Conservative scales from the 2004 PELA survey
data(colombia)
tmp <- colombia[,c(5:8,12:17)]
result <- aldmck(data=tmp, polarity=7, respondent=10, missing=c(99),verbose=TRUE)
summary(result)
plot.cdf(result)




