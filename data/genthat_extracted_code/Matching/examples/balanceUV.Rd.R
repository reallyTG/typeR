library(Matching)


### Name: balanceUV
### Title: Univariate Balance Tests
### Aliases: balanceUV
### Keywords: univar

### ** Examples

data(lalonde)
attach(lalonde)

foo  <- balanceUV(re75[treat==1],re75[treat!=1])
summary(foo)




