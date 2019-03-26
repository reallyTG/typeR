library(IPMpack)


### Name: addPdfGrowthPic
### Title: Adds probability density functions of density function of size
###   or increment given current size and growth to plots.
### Aliases: addPdfGrowthPic

### ** Examples

# Data with size and sizeNext
dff <- generateData()

a1 <- growthModelComp(dff, makePlot = TRUE)
addPdfGrowthPic(respType = "sizeNext", 
	sizesPlotAt = c(2, 6, 10), scalar = 1, jitt = 0.1, 
		sizeRange = c(-5, 25), 
			growthObjList = a1$growthObjects, cols = 2:5)




