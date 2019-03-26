library(urca)


### Name: bh6lrtest
### Title: Likelihood ratio test for restrictions under partly known beta
###   in a subspace
### Aliases: bh6lrtest
### Keywords: regression

### ** Examples

data(UKpppuip)
attach(UKpppuip)
dat1 <- cbind(p1, p2, e12, i1, i2)
dat2 <- cbind(doilp0, doilp1)
H1 <- ca.jo(dat1, type='trace', K=2, season=4, dumvar=dat2)
H6 <- matrix(c(1,0,0,0,0, 0,1,0,0,0, 0,0,1,0,0), c(5,3))
bh6lrtest(z=H1, H=H6, r=2, r1=1, conv.val=0.0001, max.iter=50)



