library(NTS)


### Name: uTAR.grid
### Title: Search for Threshold Value of A Two-Regime SETAR Model
### Aliases: uTAR.grid

### ** Examples

arorder=rep(1,2)
ar.coef=matrix(c(0.7,-0.8),2,1)
y=uTAR.sim(100,arorder,ar.coef,1,0)
uTAR.grid(y$series,1,1,1,y$series,c(0,1),c(0.2,0.8),TRUE)



