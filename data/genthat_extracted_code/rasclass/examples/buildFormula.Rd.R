library(rasclass)


### Name: buildFormula
### Title: Build a formula for Raster Classification
### Aliases: buildFormula buildFormula,rasclass-method
### Keywords: formula rasclass

### ** Examples

## Not run: 
##D # Load data from external folder
##D object <- readRasterFolder(path = "mypath", samplename = "mysample",
##D 	filenames = c('myvar1.asc', 'myvar2.asc'))
## End(Not run)

# For this example, create artificial data
mysample <- c(rep(rep(c(1,2), each = 25), 25), rep(rep(c(3,4), each = 25), 25))
mysample <- mysample + sample(c(0, NA), 2500, replace = TRUE, prob = c(1, 10))
myvar1 <- rep(1:50, each = 50) + rnorm(2500, 0, 5)
myvar2 <- rep(rep(1:50), 50) + rnorm(2500, 0, 5)
myvar3 <- sample(1:2500)
newdata <- data.frame(mysample, myvar1, myvar2, myvar3)

# Prepare a rasclass object using the dataframe and specifying raster properties
object <- new('rasclass')
object <- setRasclassData(newdata, ncols = 50, nrows = 50,
	xllcorner = 0, yllcorner = 0, cellsize = 1, NAvalue = -9999,
	samplename = 'mysample')

# Classify and show results using all columns
object <- classifyRasclass(object)
summary(object)

# Change formula to exclude one variable
object <- buildFormula(object, varlist = c('myvar1', 'myvar3'))

# Classify and show results
object <- classifyRasclass(object)
summary(object)



