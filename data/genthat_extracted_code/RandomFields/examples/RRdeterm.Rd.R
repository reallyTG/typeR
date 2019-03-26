library(RandomFields)


### Name: RRdeterm
### Title: Degenerate Distributions
### Aliases: RRdeterm
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
x <- seq(-2, 2, 0.001)
p <- RFpdistr(RRdeterm(mean=1), q=x)
plot(x, p, type="l")
## Don't show: 
FinalizeExample()
## End(Don't show)


