library(parallelML)


### Name: trainSample
### Title: Sample data in parallel
### Aliases: trainSample

### ** Examples

## Not run: 
##D # Create your data
##D x <- data.frame(1:10,10:1)
##D 
##D # Sampling on observations
##D trainSample(x,numberCores=2,samplingSize = 0.5)
##D 
##D #Create your data
##D data(iris)
##D 
##D # Sampling on variables
##D trainSample(iris,numberCores=2,samplingSize = 0.6,
##D             toPredict = "Species", sampleMethod = "random")
##D 
##D # Create your data
##D data(iris)
##D data <- iris[1:110,]
##D 
##D # Sampling
##D trainSamples <- trainSample(data,2,0.2,TRUE,"Species","virginica")
## End(Not run)



