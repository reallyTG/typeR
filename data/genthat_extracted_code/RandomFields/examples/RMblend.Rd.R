library(RandomFields)


### Name: RMblend
### Title: Scale model for a few areas of different scales and/or
###   differentiabilities
### Aliases: RMblend
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0,1, if (interactive()) 0.01 else 0.5)
len <- length(x)
m <- matrix(1:len, nc=len, nr=len)
m <- m > t(m)
image(m) # two areas separated by the first bisector

biwm <- RMbiwm(nudiag=c(0.3, 1), nured=1, rhored=1, cdiag=c(1, 1), 
                s=c(1, 1, 0.5))
model <- RMblend(multi=biwm, blend=RMcovariate(data = as.double(m), raw=TRUE))
plot(z <- RFsimulate(model, x, x)) ## takes a while ...
## Don't show: 
FinalizeExample()
## End(Don't show)


