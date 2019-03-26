library(RandomFields)


### Name: RRgauss
### Title: Vector Of Independent Gaussian Random Variables
### Aliases: RRgauss
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
r <- RFrdistr(RRgauss(mu=c(1,5)), n=1000, dim=2)
plot(r[1,], r[2, ])
## Don't show: 
FinalizeExample()
## End(Don't show)


