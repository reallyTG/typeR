library(RandomFields)


### Name: RFfctn
### Title: Evaluate Covariance and Variogram Functions
### Aliases: RFfctn
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp() - 1
RFfctn(model, 1:10)


## Don't show: 
FinalizeExample()
## End(Don't show)


