library(PatternClass)


### Name: buildsurfs
### Title: Build an array of surfaces across compositional and
###   configuration analysis space.
### Aliases: buildsurfs
### Keywords: distribution

### ** Examples

surfaces <- data$surfaces
# COMPUTE SURFACES
## No test: 
surfaceexample <- buildsurfs(reps = 5, verbose = TRUE) 
## End(No test)
# COMPUTE MEDIAN SURFACE FOR A SINGLE METRIC
tempmed <- apply(surfaces[9,,,], MARGIN=c(1,2), median)
# PRODUCE A PERSPECTIVE PLOT OF MEDIAN VALUES RESULTS FOR THE SELECTED METRIC
persp(tempmed, ticktype="detailed", cex.axis=0.7, zlab="Metric", 
ylab="Proportion", xlab="Rho", theta=-45)
# COMPUTE VARIANCE SURFACE FOR A SINGLE METRIC
tempvar <- apply(surfaces[9,,,], MARGIN=c(1,2), var)
# PRODUCE A PERSPECTIVE PLOT OF VARIANCE VALUES RESULTS FOR THE SELECTED METRIC
persp(tempvar, ticktype="detailed", cex.axis=0.7, zlab="Metric", 
ylab="Proportion", xlab="Rho", theta=-45)



