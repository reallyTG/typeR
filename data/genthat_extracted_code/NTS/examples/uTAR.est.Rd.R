library(NTS)


### Name: uTAR.est
### Title: General Estimation of TAR Models
### Aliases: uTAR.est

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)
est=uTAR.est(y$series,arorder,0,1)



