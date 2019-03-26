library(parallelSVM)


### Name: trainSample
### Title: Sample data in parallel
### Aliases: trainSample

### ** Examples

## Not run: 
##D # Create your data
##D x <- data.frame(1:10,10:1)
##D y <- 1:10
##D 
##D # Sampling with provided y
##D trainSample(x,y,numberCores=2,samplingSize = 0.5)
##D 
##D # Sampling without provided y
##D trainSample(x,numberCores=2,samplingSize = 0.5)
## End(Not run)



