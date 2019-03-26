library(kcirt)


### Name: ikcirt.rndData1
### Title: Random Data
### Aliases: ikcirt.rndData1
### Keywords: ~kwd1 ~kwd2

### ** Examples

constructMap.ls <- list(
c(1,2),
c(2,3),
c(1,3)
)

qTypes <- rep("R", length(constructMap.ls))

mod <- kcirt.model(constructMap.ls=constructMap.ls, qTypes=qTypes, mxLambda=NULL)

N <- 50
set.seed(99999)
mod <- kcirt.sim(model=mod, N=N)

ikcirt.rndData1(N=N, qTypes=qTypes, mxDelta=mod$mxDelta, ns=mod$ns)




