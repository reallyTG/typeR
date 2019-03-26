library(TSclust)


### Name: diss.SPEC.LLR
### Title: General Spectral Dissimilarity Measure Using Local-Linear
###   Estimation of the Log-Spectra
### Aliases: diss.SPEC.LLR
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(50))
y <- cumsum(rnorm(50))
z <- sin(seq(0, pi, length.out=50))
## Compute the distance and check for coherent results
diss.SPEC.LLR(x, y, plot=TRUE)
diss.SPEC.LLR(x, z, n=0) #try integrate instead of interpolation
diss.SPEC.LLR(y, z, method="LK", n=0) #maximum likelihood with integration
#create a dist object for its use with clustering functions like pam or hclust
diss(rbind(x,y,z), METHOD="SPEC.LLR", method="DLS", alpha=0.5, n=50)




