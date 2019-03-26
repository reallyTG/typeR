library(RandomFields)


### Name: Distribution Families
### Title: Distribution families (RR commands)
### Aliases: RR RRmodel RRmodels
### Keywords: spatial distribution

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## here, the scale is given by an exponential variable:
model <- RMgauss(scale=exp())
for (i in 1:4) {
  RFoptions(seed = i)
  # each leads to a simulation with a different scale parameter
  plot(model) ## random
  plot(RFsimulate(model, x=seq(0,10,0.1)))
  readline("press return")
}

# but here, all 4 simulations have the same (but random) scale:
plot(RFsimulate(model, x=seq(0,10,0.1), n=4)) 


## hierarchical models are also possible:
## here, the scale is given by an exponential variable whose
## rate is given by a uniform variable
model <- RMgauss(scale=exp(rate=unif()))
plot(model)
plot(RFsimulate(model, x=seq(0,10,0.1)))


## HOWEVER, the next model is deterministic with scale \code{e=2.718282}.
model <- RMgauss(scale=exp(1))
plot(model)
plot(RFsimulate(model, x=seq(0,10,0.1)))

## Don't show: 
FinalizeExample()
## End(Don't show)


