library(NTS)


### Name: uTAR
### Title: Estimation of a Univariate Two-Regime SETAR Model
### Aliases: uTAR

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)
est=uTAR(y$series,1,1,1,y$series,c(0.2,0.8),100,TRUE,c(0.2,0.8))



