library(RandomFields)


### Name: RPchi2
### Title: Simulation of Chi2 Random Fields
### Aliases: RPchi2
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RPchi2(RMexp(), f=2)
x <- seq(0, 10, 0.1)
z <- RFsimulate(model=model, x, x, n=4)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


