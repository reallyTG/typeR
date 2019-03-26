library(gclus)


### Name: plotcolors
### Title: Plots a matrix of colors
### Aliases: plotcolors imageinfo
### Keywords: color hplot

### ** Examples


plotcolors(matrix(1:20,nrow=4,ncol=5))

plotcolors(matrix(1:20,nrow=4,ncol=5),ptype="points",cex=6)

plotcolors(matrix(1:20,nrow=4,ncol=5),rlabels = c("a","b","c","d"))


data(longley)
longley.cor <- cor(longley)
# A matrix with equal (or nearly equal) number of entries of each color.
longley.color <- dmat.color(longley.cor)


plotcolors(longley.color, dlabels=rownames(longley.color))

# Could also reorder variables prior to plotting:
longley.o <- order.single(longley.cor)
longley.color <- longley.color[longley.o,longley.o]

op <- par(mar=c(1,6,6,1))
plotcolors(longley.color,rlabels=rownames(longley.color),clabels=rownames(longley.color) )
par(op)




