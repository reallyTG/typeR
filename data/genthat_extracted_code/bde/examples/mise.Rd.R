library(bde)


### Name: mise
### Title: Mean Integrated Squared Error
### Aliases: mise
### Keywords: utils-methods

### ** Examples


# a general approximation to a Beta(1,10) distribution using BoundedDensity objects
cache <- seq(0,1,0.01)
dens  <- dbeta(cache,1,10)
bd    <- boundedDensity(x=cache,densities=dens)

# a BrVitale approximation to the Beta(1,10) distribution using a random data sample to 
# learn the model
dataSample <- rbeta(100,1,10)
kernel     <- hirukawaTSKernel(dataPoints=dataSample, b=0.1, c=0.3, 
                                dataPointsCache=cache, modified=FALSE)

# compute the mise
mise(bd,kernel,discreteApproximation=TRUE)
mise(bd,kernel,discreteApproximation=FALSE)



