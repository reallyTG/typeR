library(mvnormtest)


### Name: mshapiro.test
### Title: Shapiro-Wilk Multivariate Normality Test
### Aliases: mshapiro.test
### Keywords: htest

### ** Examples

library(mvnormtest)
data(EuStockMarkets)

C <- t(EuStockMarkets[15:29,1:4])
mshapiro.test(C)

C <- t(EuStockMarkets[14:29,1:4])
mshapiro.test(C)

R <- t(diff(t(log(C))))
mshapiro.test(R)

dR <- t(diff(t(R)))
mshapiro.test(dR)




