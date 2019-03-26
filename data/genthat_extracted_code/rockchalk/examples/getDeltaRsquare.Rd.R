library(rockchalk)


### Name: getDeltaRsquare
### Title: Calculates the delta R-squares, also known as squared
###   semi-partial correlation coefficients.
### Aliases: getDeltaRsquare

### ** Examples

dat1 <- genCorrelatedData(N=250, means=c(100,100),
sds=c(30,20), rho=0.0,  stde = 7, beta=c(1.1, 2.4, 4.1, 0))
m1 <- lm(y ~ x1 + x2, data=dat1)
getDeltaRsquare(m1)
## more problematic in presence of collinearity
dat2 <- genCorrelatedData(N=250, means=c(100,100),
sds=c(30,20), rho=0.6,  stde = 7, beta=c(1.1, 2.4, 4.1, 0))
m2 <- lm(y ~ x1 + x2, data=dat2)
getDeltaRsquare(m2)



