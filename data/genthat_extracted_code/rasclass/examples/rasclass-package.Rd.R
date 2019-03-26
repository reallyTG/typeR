library(rasclass)


### Name: rasclass-package
### Title: Supervised Raster Image Classification
### Aliases: rasclass rasclass-package
### Keywords: package classification raster ascii landcover multinom MLC

### ** Examples

## Not run: 
##D # If available, load data from external folder
##D object <- readRasterFolder(path = "mypath", samplename = "mysample",
##D 	filenames = c('myvar1.asc', 'myvar2.asc'))
## End(Not run)

# For this example, create artificial data
mysample <- c(rep(rep(c(1,2), each = 25), 25), rep(rep(c(3,4), each = 25), 25))
mysample <- mysample + sample(c(0, NA), 2500, replace = TRUE, prob = c(1, 50))
myvar1 <- rep(1:50, each = 50) + rnorm(2500, 0, 5)
myvar2 <- rep(rep(1:50), 50) + rnorm(2500, 0, 5)
newdata <- data.frame(mysample, myvar1, myvar2)

# Prepare a rasclass object using the dataframe and specifying raster properties
object <- new('rasclass')
object <- setRasclassData(newdata, ncols = 50, nrows = 50,
	xllcorner = 0, yllcorner = 0, cellsize = 1, NAvalue = -9999,
	samplename = 'mysample')

# Classify using each algorithm once
outlist <- list()
outlist[['maximumLikelihood']] <- classifyRasclass(object, method = 'maximumLikelihood')
summary(outlist[['maximumLikelihood']])

outlist[['logit']] <- classifyRasclass(object, method = 'logit')
summary(outlist[['logit']])

outlist[['neuralNetwork']] <- classifyRasclass(object, method = 'neuralNetwork')
summary(outlist[['neuralNetwork']])

outlist[['randomForest']] <- classifyRasclass(object, method = 'randomForest')
summary(outlist[['randomForest']])

outlist[['supportVector']] <- classifyRasclass(object, method = 'supportVector')
summary(outlist[['supportVector']])

# Store sample data as a rasclassRaster for display purposes
mysample.ras <- new('rasclassRaster')
mysample.ras@grid <- mysample
mysample.ras@nrows <- 50
mysample.ras@ncols <- 50
mysample.ras@xllcorner <- 0
mysample.ras@yllcorner <- 0
mysample.ras@cellsize <- 1
mysample.ras@NAvalue <- -9999

# Plot results of each classifier
opar <- par(mfrow = c(2, 3))
image(mysample.ras)
title('Sample data')
for(i in 1:length(outlist)) {
	image(outlist[[i]]@predictedGrid)
	title(names(outlist)[[i]])
}
par(opar)



