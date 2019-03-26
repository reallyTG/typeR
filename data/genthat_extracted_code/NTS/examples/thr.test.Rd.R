library(NTS)


### Name: thr.test
### Title: Threshold Nonlinearity Test
### Aliases: thr.test

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)
thr.test(y$series,1,1,y$series,40,TRUE)



