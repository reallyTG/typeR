library(NTS)


### Name: uTAR.pred
### Title: Prediction of A Fitted Univariate TAR Model
### Aliases: uTAR.pred

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)
est=uTAR.est(y$series,arorder,0,1)
pred=uTAR.pred(est,100,1,100,0.95,TRUE)



