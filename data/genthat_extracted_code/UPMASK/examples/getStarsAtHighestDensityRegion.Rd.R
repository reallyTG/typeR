library(UPMASK)


### Name: getStarsAtHighestDensityRegion
### Title: Perform cut in the membership list based on the 2D space
###   distribution
### Aliases: getStarsAtHighestDensityRegion
### Keywords: utilities

### ** Examples

# Create a simple data set
toyDataDF <- data.frame(x=runif(50, 0, 10), y=runif(50, 0, 10), resMclust.class=rep(1, 50))
toyDataDF <- rbind(toyDataDF, data.frame(x=rnorm(50, 2, 3),
                   y=rnorm(50, 4, 3), resMclust.class=rep(1, 50)))

# Perform the XY density based cut
toyRes <- getStarsAtHighestDensityRegion(toyDataDF)

# Clean the environment
rm(list=c("toyDataDF", "toyRes"))



