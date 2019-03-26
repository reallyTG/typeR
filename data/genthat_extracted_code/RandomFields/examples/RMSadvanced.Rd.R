library(RandomFields)


### Name: RMSadvanced
### Title: Scaling operator - comments for advanced applications
### Aliases: RMSadvanced
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample(FALSE)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,1, if (interactive()) 0.01 else 0.5)
d <- sqrt(rowSums(as.matrix(expand.grid(x-0.5, x-0.5))^2))
d <- matrix(d < 0.25, nc=length(x))
image(d)

scale <- RMcovariate(data=as.double(d) * 2 + 0.5, raw=TRUE)

S <- RMexp(scale = scale)
plot(zS <- RFsimulate(S, x, x))
CS <- RFcovmatrix(S, x, x)


## Don't show: 
FinalizeExample()
## End(Don't show)


