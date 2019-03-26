library(fda)


### Name: landmarkreg
### Title: Landmark Registration of Functional Observations
### Aliases: landmarkreg
### Keywords: smooth

### ** Examples

#See the analysis for the lip data in the examples.

## setting parameters
library(lattice)
data(landmark.reg.expData) ## containing an simple object called sampleData

# Preferred:
# eps <- .Machine$double.eps
# to reduce compute time:
eps <- 1000*.Machine$double.eps
from <- -1.0187
to <- 9.4551
# Preferred:
# nb <- 201
# to reduce compute time:
nb <- 31
nbreaks <- 11
## assign landmarks
landmark <- matrix(c(0.4999, 0.657, 0.8141, 0.5523, 0.5523,
                     3.3279, 3.066, 3.0137, 3.2231, 3.2231),
                   ncol=2)
wbasis <- create.bspline.basis(rangeval=c(from, to),
	                       norder=4, breaks=seq(from, to, len=nbreaks))
Wfd0   <- fd(matrix(0,wbasis$nbasis,1),wbasis)
WfdPar <- fdPar(Wfd0, 1, 1e-4)
## get the density of the data
x <- split(sampleData, factor(sampleData$which))
# to save time, reduce the number of curves from 5 to 3
k <- 3
densY <- sapply(x[1:k], function(z){
            r <- range(z[, 1])
            z <- z[, 1]
            z <- z[z>r[1]+eps & z<r[2]-eps]
            density(z, from=from, to=to, n=nb, na.rm=TRUE)$y
        })

argvals <- seq(from, to, len=nb)
fdobj   <- smooth.basis(argvals, densY, wbasis,
                   fdnames = c("x", "samples", "density"))$fd

regDens   <- landmarkreg(fdobj, landmark[1:k,], WfdPar=WfdPar, monwrd=TRUE)

warpfdobj <- regDens$warpfd
warpedX   <- as.matrix(eval.fd(warpfdobj, argvals))
funs      <- apply(warpedX, 2, approxfun, argvals)
## newDat <- list()
## for (i in 1:length(funs))
##   newDat[[names(funs)[i]]] <- data.frame(data=funs[[i]](x[[i]][,1]),
##                                          which=names(funs)[i])
## visualization
## lattice::densityplot(~ data | which, sampleData,
##                    layout=c(1,5), col="#A6CEE3", n=120,
##                     main="Original data set")
## dev.new()
## lattice::densityplot( ~ data | which, layout=c(1,length(newDat)),
##                      do.call(rbind, newDat), col="#A6CEE3", n=120,
##                      main="After warping")


## 


