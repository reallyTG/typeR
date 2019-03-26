library(FitAR)


### Name: getT
### Title: t-statistic for unit root test
### Aliases: getT
### Keywords: ts htest

### ** Examples

z <- cumsum(rnorm(100))
ans <- FitAR(z, p=1)
getT(ans)



