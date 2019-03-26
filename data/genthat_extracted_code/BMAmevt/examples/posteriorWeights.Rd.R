library(BMAmevt)


### Name: posteriorWeights
### Title: Posterior model weights
### Aliases: posteriorWeights

### ** Examples

data(pb.Hpar)
data(nl.Hpar)
set.seed(5)
mixDat=rbind(rpairbeta(n=10,dimData=3, par=c(0.68,3.1,0.5,0.5)),
  rnestlog(n=10,par=c(0.68,0.78, 0.3,0.5)))
posteriorWeights (dat=mixDat,
                  HparList=list(get("pb.Hpar"),get("nl.Hpar")),
                  lklList=list(get("dpairbeta"), get("dnestlog")),
                  priorList=list(get("prior.pb"), get("prior.nl")),
                  priorweights=c(0.5,0.5),
                  Nsim=1e+3,
                  Nsim.min=5e+2, precision=0.1,
                  displ=FALSE)
## Not run: 
##D posteriorWeights (dat=mixDat,
##D                   HparList=list(get("pb.Hpar"),get("nl.Hpar")),
##D                   lklList=list(get("dpairbeta"), get("dnestlog")),
##D                   priorList=list(get("prior.pb"), get("prior.nl")),
##D                   priorweights=c(0.5,0.5),
##D                   Nsim=20e+3,
##D                   Nsim.min=10e+3, precision=0.05,
##D                   displ=TRUE)
## End(Not run)



