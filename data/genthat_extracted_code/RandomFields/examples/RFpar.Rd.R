library(RandomFields)


### Name: RFpar
### Title: Graphical parameters for plots
### Aliases: RFpar
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFpar(col="red")
plot(RMexp())

## Don't show: 
FinalizeExample(); RFpar(col=NULL)
## End(Don't show)


