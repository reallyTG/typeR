library(WrightMap)


### Name: fitgraph
### Title: Item Fit Graphs
### Aliases: fitgraph fitgraph.default fitgraph.CQmodel fitgraph.character
###   fitgraph.numeric
### Keywords: hplot

### ** Examples


# Generating mock data
sampleLabels <- paste('item',1:10)

fitBounds <- (abs(rnorm(10, mean = 0, sd = .05)) * 2)
fitEst <- rnorm(10, mean = 1, sd = .1)

fitLB <- 1 - fitBounds
fitUB <- 1 + fitBounds
par("mar")
# running fitgraph
fitgraph(fitEst,fitLB,fitUB,itemLabels=sampleLabels)

#From ConQuest output:
	
	fpath <- system.file("extdata", package="WrightMap")

	fitgraph(file.path(fpath,"ex2.shw"))






