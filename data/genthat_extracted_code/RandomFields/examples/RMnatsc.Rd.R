library(RandomFields)


### Name: RMnatsc
### Title: Natural scale
### Aliases: RMnatsc

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMnatsc(RMexp())
x <- seq(0, 10, 0.02)
plot(RMexp(), model=model)
RFcov(model, 1)
## Don't show: 
FinalizeExample()
## End(Don't show)



