library(cmce)


### Name: gp.realize
### Title: Draw an unconditional GP realization.
### Aliases: gp.realize

### ** Examples

library(cmce)

design=matrix(runif(10,1,5),ncol=2,nrow=5)
r=getranges(design)
design=scaledesign(design,r)
l.v=makedistlist(design)
rho=c(0.2,0.01)
muv=rep(0,nrow(design))
lambdav=1
surface=gp.realize(l.v,muv,lambdav,rho)




