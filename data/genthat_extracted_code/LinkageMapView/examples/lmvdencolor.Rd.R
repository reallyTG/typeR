library(LinkageMapView)


### Name: lmvdencolor
### Title: LinkageMapView density color function
### Aliases: lmvdencolor

### ** Examples


# add a column to a linkage group data frame to specify colors for
# line segments in lmv.linkage.plot using default colors from RColorBrewer
# Spectral palette.  Then just plot the returned colors out to see how
# they look.

data(oat)

sectcoldf <- lmvdencolor(oat)

# see colors produced

image(seq_along(oat[,2]), 1, as.matrix(seq_along(oat[,2])),
 col=sectcoldf$col, axes=FALSE, xlab="", ylab="")



