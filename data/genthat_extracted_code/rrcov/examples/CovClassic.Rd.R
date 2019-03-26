library(rrcov)


### Name: CovClassic
### Title: Classical Estimates of Multivariate Location and Scatter
### Aliases: CovClassic Cov
### Keywords: classes robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cv <- CovClassic(hbk.x)
cv
summary(cv)
plot(cv)



