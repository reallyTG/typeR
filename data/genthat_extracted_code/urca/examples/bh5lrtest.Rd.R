library(urca)


### Name: bh5lrtest
### Title: Likelihood ratio test for restrictions under partly known beta
### Aliases: bh5lrtest
### Keywords: regression

### ** Examples

data(UKpppuip)
attach(UKpppuip)
dat1 <- cbind(p1, p2, e12, i1, i2)
dat2 <- cbind(doilp0, doilp1)
H1 <- ca.jo(dat1, type='trace', K=2, season=4, dumvar=dat2)
H51 <- c(1, -1, -1, 0, 0)
H52 <- c(0, 0, 0, 1, -1)
summary(bh5lrtest(H1, H=H51, r=2))
summary(bh5lrtest(H1, H=H52, r=2))



