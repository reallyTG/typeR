library(TSclust)


### Name: diss.SPEC.ISD
### Title: Dissimilarity Based on the Integrated Squared Difference between
###   the Log-Spectra
### Aliases: diss.SPEC.ISD
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create two sample time series
x <- cumsum(rnorm(50))
y <- cumsum(rnorm(50))
z <- sin(seq(0, pi, length.out=50))
## Compute the distance and check for coherent results
diss.SPEC.ISD(x, y, plot=TRUE) 
#create a dist object for its use with clustering functions like pam or hclust
## Not run: 
##D diss.SPEC.ISD(x, y, plot=TRUE, n=0)#try integrate instead of interpolation
##D diss( rbind(x,y,z), "SPEC.ISD" )
## End(Not run)




