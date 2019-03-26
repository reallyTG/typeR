library(RandomFields)


### Name: RFoldstyle
### Title: RFoldstyle
### Aliases: RFoldstyle
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

GaussRF(x=1:10, model="exp", param=c(0,1,0,1), grid=TRUE)

RFoldstyle()
GaussRF(x=1:10, model="exp", param=c(0,1,0,1), grid=TRUE)

## Don't show: 
RFoldstyle(FALSE)
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


