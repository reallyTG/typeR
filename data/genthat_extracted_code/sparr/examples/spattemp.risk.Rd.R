library(sparr)


### Name: spattemp.risk
### Title: Spatiotemporal relative risk/density ratio
### Aliases: spattemp.risk rrst

### ** Examples

## No test: 
data(fmd)
fmdcas <- fmd$cases
fmdcon <- fmd$controls

f <- spattemp.density(fmdcas,h=6,lambda=8) # stden object as time-varying case density
g <- bivariate.density(fmdcon,h0=6) # bivden object as time-static control density
rho <- spattemp.risk(f,g,tolerate=TRUE) 
print(rho)

par(mfrow=c(2,3))
plot(rho$f$spatial.z,main="Spatial margin (cases)") # spatial margin of cases
plot(rho$f$temporal.z,main="Temporal margin (cases)") # temporal margin of cases
plot(rho$g$z,main="Spatial margin (controls)") # spatial margin of controls
plot(rho,tselect=50,type="conditional",tol.args=list(levels=c(0.05,0.0001),
     lty=2:1,lwd=1:2),override.par=FALSE)
plot(rho,tselect=100,type="conditional",tol.args=list(levels=c(0.05,0.0001),
     lty=2:1,lwd=1:2),override.par=FALSE)
plot(rho,tselect=200,type="conditional",tol.args=list(levels=c(0.05,0.0001),
     lty=2:1,lwd=1:2),override.par=FALSE)
## End(No test)



