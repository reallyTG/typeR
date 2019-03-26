library(rrcov)


### Name: CovClassic-class
### Title: Class "CovClassic" - classical estimates of multivariate
###   location and scatter
### Aliases: CovClassic-class
### Keywords: classes robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cv <- CovClassic(hbk.x)
cv
summary(cv)
plot(cv)



