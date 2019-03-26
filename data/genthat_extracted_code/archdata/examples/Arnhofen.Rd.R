library(archdata)


### Name: Arnhofen
### Title: Point pattern of mining pits from the Neolithic chert mine at
###   Arnhofen
### Aliases: Arnhofen
### Keywords: datasets

### ** Examples

# data and package spatstat by A. Baddeley et al. 2016 for point pattern analysis
library(archdata)
data(Arnhofen)
# package spatstat is described and illustrated in Baddeley et al. (2016)
library(spatstat)
ap <- Arnhofen	      # to shorten the following code

# generate observation window object; note the polygonal outline.
arnwin <- owin(poly=ap$window[, 1:2])	

# generate point process pattern object from points and owin object
app <- ppp(ap$points$x, ap$points$y, arnwin) 
unitname(app) <- c("metre", "metres")   # optional, asign unitnames

# note that owin vertices traverse the polygon anticlockwise
plot(arnwin)
points(ap$window[, 1:2], pch=3, cex=.5)
text(ap$window[, 1], ap$window[, 2], ap$window[, 3], pos=3, cex=.7)

# visual inspection of the point process pattern 
plot(app)

# Computing the summary function "centered Besag's L" assuming
# homogeneous intensity. Centered Besag's L is just a conveniently 
# transformed Ripley's K. see references in ?Lest.

set.seed(1)	
Lcentrd <- envelope(app, Lest, nsim=99, nrank=1, global=TRUE, r=seq(0,7, 0.01),
     correction="translate", transform=expression(.-r))
# for the arguments see ?Kest and ?envelope. 

tm <- "Centered Besags's L for Arnhofen-Southeast"  # title

plot(Lcentrd, legendpos="bottomright", legendargs=list(bg="white"),
     main=tm, las=1)

# The deviations below envelopes suggest regular inter point distances
# at the 1% level - deviations above would have suggested clustering
# with r representing the radius of round clusters.

plot(Lcentrd, xlim=c(.5,2), legendpos="topright", legendargs=list(bg="white"),
     las=1, main=tm)
(inhibr <- Lcentrd$r[Lcentrd$obs<Lcentrd$lo])	

# significant inhibition between pits at distances of
# With an average diameter of 1 m pits were spaced at regular 
# distances up to about 0.7 m apart:

max(inhibr) - 1

citation("spatstat")      # don't forget to reference the method.



