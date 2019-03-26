library(mvsf)


### Name: mvsf
### Title: Shapiro-Francia Multivariate Normality Test
### Aliases: mvsf

### ** Examples

library(mvsf)
data(EuStockMarkets)

X <- t(EuStockMarkets[15:29,1:4])
mvsf(X)



