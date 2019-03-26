library(IPMpack)


### Name: predictFutureDistribution
### Title: Predicts continuous (e.g. size) stage distribution in the future
###   giving current population's stage distribution.
### Aliases: predictFutureDistribution

### ** Examples


# Define starting population of interest
startPop <- rnorm(1000,2,1)

# Build T and F matrix
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = 1.1*min(dff$size, na.rm = TRUE),
maxSize = 1.1*max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff), correction = "constant")
Fmatrix <- makeIPMFmatrix(minSize = 1.1*min(dff$size, na.rm = TRUE),
maxSize = 1.1*max(dff$size, na.rm = TRUE), 
fecObj = makeFecObj(dff, fecConstants = data.frame(est=0.7), Transform="log"), 
correction="constant")

# Make an IPMmatrix object containing P matrix + F matrix 
# by replacing the P matrix
IPM <- Pmatrix
IPM@.Data <- Pmatrix + Fmatrix

# Project population five steps
a5 <- predictFutureDistribution(startingSizes = startPop, IPM = IPM,
n.time.steps = 5, startingEnv = 1)



