library(PlotRegionHighlighter)


### Name: tangentLine
### Title: Compute the coefficients for the line tangent to two circles
### Aliases: tangentLine
### Keywords: aplot

### ** Examples

############################################################
# plot 

plotCircles <- function(center, r, color="red", ...) 
{
	a <- createCircle(center, r, ...)
	grid.polygon(x = a[,1], y = a[,2], gp=gpar(col=color, lwd=2))
	
	a
} 


require(grid)
grid.newpage()
ncircles <- 2
centers <- matrix(runif(4, min=.2, max=.8), byrow=TRUE, ncol=2)
r <- runif(ncircles,min=.10, max=.20)

colors <- rainbow(ncircles * 3 + 3)
for (i in 1:ncircles) circles<- plotCircles(centers[i,], r[i], color=colors[i])
grid.text(1:ncircles, centers[,1], centers[,2])

ii <- 0
for (r0 in r[1] * c(1,-1))
	for (k in c(1,-1)) {
		ii <- ii + 1
		tangent <- tangentLine(centers[1,], centers[2,], r0, r[2], k=k)  # compute coefficients for the tangent line, if NA, then no tangents

		if (!is.na(tangent["a"]))
			grid.abline(-tangent["c"] / tangent["b"], -tangent["a"] / tangent["b"], gp=gpar(col="blue", lwd=ii), units="npc")
	}



