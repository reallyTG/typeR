library(RandomFields)


### Name: RRspheric
### Title: Random scaling used with balls
### Aliases: RRspheric
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

hist(RFrdistr(RRspheric(balldim=2), n=1000), 50)
## Don't show: 
FinalizeExample()
## End(Don't show)


