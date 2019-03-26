library(basicspace)


### Name: plot.aldmck_negative
### Title: Aldrich-McKelvey Negative Coordinate Distribution Plot
### Aliases: plot.aldmck_negative
### Keywords: multivariate

### ** Examples

### Loads and scales the Liberal-Conservative scales from the 1980 NES.
data(LC1980)
result <- aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9),verbose=TRUE)
summary(result)
plot.aldmck_negative(result,xlim=c(-1.5,1.5))



