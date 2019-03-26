library(krm)


### Name: krm.score.test
### Title: Adjusted Score Test
### Aliases: krm.score.test
### Keywords: ~kwd1 ~kwd2

### ** Examples


dat=sim.liu.2008(n=100, a=0, seed=1)
z=as.matrix(subset(dat, select=c(z.1,z.2,z.3,z.4,z.5)))
rho=1
K=kyotil::getK(z,kernel="rbf",para=rho^-2)
krm.score.test (y~x, dat, K, regression.type="logistic") 





