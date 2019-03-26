library(gclus)


### Name: dmat.color
### Title: Colors a symmetric matrix
### Aliases: dmat.color default.dmat.color
### Keywords: multivariate color

### ** Examples

data(longley)
longley.cor <- cor(longley)
# A matrix with equal (or nearly equal) number of entries of each color.
longley.color <- dmat.color(longley.cor)

# Plot the colors
plotcolors(longley.color,dlabels=rownames(longley.color))

# Try different color schemes

# A matrix where each color represents an equal-length interval.
longley.color <- dmat.color(longley.cor, byrank=FALSE)
# Specify colors and breaks

longley.color <- dmat.color(longley.cor, breaks=c(-1,0,.5,.8,1), 
cm.colors(4))


# Could also reorder variables prior to plotting:

longley.o <- order.single(longley.cor)
longley.color <- longley.color[longley.o,longley.o]

# The colors can be used in a scatterplot matrix or parallel
# coordinate display:

cpairs(longley, panel.color= longley.color)
cparcoord(longley, panel.color= longley.color)




