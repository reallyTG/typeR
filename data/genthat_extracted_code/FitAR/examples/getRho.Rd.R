library(FitAR)


### Name: getRho
### Title: Normalized rho unit root test statistic
### Aliases: getRho
### Keywords: ts htest

### ** Examples

z <- cumsum(rnorm(100))
ans <- FitAR(z, p=1)
getRho(ans)



