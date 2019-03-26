library(RandomFields)


### Name: Strokorb's Functions
### Title: Tail correlation function of the Brown-Resnick process
### Aliases: RMstrokorb RMm2r RMm3b RMmps
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMbrownresnick(RMfbm(alpha=1.5, s=0.2))
plot(RMm2r(model))

x <- seq(0, 10, 0.005)
z <- RFsimulate(RPsmith(RMm2r(model), xi=0), x)
plot(z, type="p", pch=20)

## Don't show: 
FinalizeExample()
## End(Don't show)


