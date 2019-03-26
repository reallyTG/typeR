library(sysid)


### Name: iv4
### Title: ARX model estimation using four-stage instrumental variable
###   method
### Aliases: iv4

### ** Examples

mod_dgp <- idpoly(A=c(1,-0.5),B=c(0.6,-.2),C=c(1,0.6),ioDelay = 2,noiseVar = 0.1)
u <- idinput(400,"prbs")
y <- sim(mod_dgp,u,addNoise=TRUE)
z <- idframe(y,u)
mod_iv4 <- iv4(z,c(1,2,2))




