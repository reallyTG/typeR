library(RandomFields)


### Name: conventional2RFspDataFrame
### Title: Coercion to class 'RFsp' objects
### Aliases: conventional2RFspDataFrame
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=50)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
x <- 1:20
z <- RFsimulate(RMexp(), x, spConform=FALSE)
z2 <- conventional2RFspDataFrame(z, coord=x)
Print(z, z2)
## Don't show: 
FinalizeExample()
## End(Don't show)


