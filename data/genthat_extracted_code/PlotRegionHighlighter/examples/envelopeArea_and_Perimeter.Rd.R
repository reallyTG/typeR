library(PlotRegionHighlighter)


### Name: envelopeArea_and_Perimeter
### Title: Calculate the area and perimeter of the envelope
### Aliases: envelopeArea_and_Perimeter
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

ncircles <- sample(3:7,1)
centers <- matrix(runif(2*ncircles, min=.2, max=.8), byrow=TRUE, ncol=2)
r <- runif(ncircles,min=.10, max=.20)

envelope <- generateEnvelope(centers, r)
print(envelope$tangent_Points)

require(grid)
grid.newpage()
colors <- rainbow(ncircles * 3 + 3)
for (i in 1:ncircles) circles<- plotCircles(centers[i,], r[i], color=colors[i])
grid.text(1:ncircles, centers[,1], centers[,2])

# plot the envelope containing the circles

envelopeXY <- envelope$envelopeXY
segments <- envelope$tangent_Points

grid.lines(envelopeXY[,1], envelopeXY[,2], gp=gpar(col="orange", lwd=5), default.units="npc")
grid.points(segments[,"x"], segments[,"y"], pch=16, gp=gpar(col="red"), default.units="npc")

# calculate the area and perimeter of the envelope

envelopeStats <- envelopeArea_and_Perimeter(segments, centers, r)

cat("envelope area = ", envelopeStats["area"], " perimeter = ", envelopeStats["perimeter"],"\n")	
cat("circle radii = ", r, "\n")
cat("circle area = ", pi * r^2, " = ", sum(pi * r^2), "\ncircle perimenter = ",  2 * pi * r, " = ",  2 * pi * sum(r), "\n")



