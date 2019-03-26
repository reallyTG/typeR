library(RandomFields)


### Name: RMcutoff
### Title: Gneiting's modification towards finite range
### Aliases: RMcutoff
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp()
plot(model, model.cutoff=RMcutoff(model, diameter=1), xlim=c(0, 4))

model <- RMstable(alpha = 0.8)
plot(model, model.cutoff=RMcutoff(model, diameter=2), xlim=c(0, 5))
x <- y <- seq(0, 4, 0.05)
plot(RFsimulate(RMcutoff(model), x=x, y = y))
## Don't show: 
FinalizeExample()
## End(Don't show)


