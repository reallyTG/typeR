library(metricTester)


### Name: centers
### Title: Calculate weighted centroids
### Aliases: centers

### ** Examples

#example of how to calculate the weighted centroids of a series of plots based on the
#traits of a set of species. begin by simulating a phylogeny with a birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#create a log-normal abundance distribution
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community data matrix, with species as columns and sites as rows
cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#simulate two traits, combine into a matrix, then ordinate with a PCA
traits <- evolveTraits(tree)[[2]]
ord <- prcomp(traits)

#the weighted centroids ("average traits") of the species in each plot
exCenter <- centers(ordination.results=ord$x, road.map=cdm)

#visual demonstration of how the function works. plot all of the species in the first
#three sites in the CDM according to their ordinated trait values, color the points
#according to the site (red=site1, purple=site2, blue=site3), and scale the size of the
#point to the abundance of that species in that site. centroids are plotted in the
#same color but given a thick black border.
plot(ord$x, type="n")
for(i in 1:3)
{
	#find the species and their abundances that occur in the relevant plot
	focal <- as.matrix(cdm)[i,][as.matrix(cdm)[i,]!=0]
	pointColors <- c(rgb(1, 0, 0, 0.6), rgb(0.7, 0, 1, 0.6), rgb(0, 0, 1, 0.6))
	for(j in 1:length(focal))
	{
		location <- ord$x[names(focal)[j],]
		points(x=location[1], y=location[2], col=pointColors[i], pch=20, cex=focal[j]/5)
	}
	points(x=exCenter[i,1], y=exCenter[i,2], pch=21, col="black", lwd=2, cex=2,
	bg=pointColors[i])
}



