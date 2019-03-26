library(NTS)


### Name: uTAR.sim
### Title: Generate Univariate SETAR Models
### Aliases: uTAR.sim

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)



