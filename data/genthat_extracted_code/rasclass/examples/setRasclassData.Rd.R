library(rasclass)


### Name: setRasclassData
### Title: Add data from dataframe to rasclass object
### Aliases: setRasclassData setRasclassData,data.frame-method
### Keywords: rasclass data

### ** Examples

# For this example, create artificial data
mysample <- c(rep(rep(c(1,2), each = 25), 25), rep(rep(c(3,4), each = 25), 25))
mysample <- mysample + sample(c(0, NA), 2500, replace = TRUE, prob = c(1, 10))
myvar1 <- rep(1:50, each = 50) + rnorm(2500, 0, 5)
myvar2 <- rep(rep(1:50), 50) + rnorm(2500, 0, 5)
newdata <- data.frame(mysample, myvar1, myvar2)

# Prepare a rasclass object using the dataframe and specifying raster properties
object <- new('rasclass')
object <- setRasclassData(newdata, ncols = 50, nrows = 50,
	xllcorner = 0, yllcorner = 0, cellsize = 1, NAvalue = -9999,
	samplename = 'mysample')

# Summarize the rasclass object
summary(object)



