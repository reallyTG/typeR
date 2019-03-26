library(RandomFields)


### Name: RFfractaldim
### Title: RFfractaldimension
### Aliases: RFfractaldim
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=50)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0, 10, 0.001)
z <- RFsimulate(RMexp(), x)
RFfractaldim(data=z)
## Don't show: 
FinalizeExample()
## End(Don't show)


