library(UPMASK)


### Name: kde2dForSubset
### Title: Compute the density based distance quantity using a 2D Kernel
###   Density Estimation
### Aliases: kde2dForSubset
### Keywords: utilities

### ** Examples

# Create a simple data set with the values and errors
toyDataDF <- data.frame(x=runif(50, 0, 10), y=runif(50, 0, 10), resMclust.class=rep(1, 50))

# Run the KDE 2D analysis for the required subset
disV <- kde2dForSubset(toyDataDF, showStats=FALSE, printPlots=FALSE, returnDistance=TRUE)

# Clean the environment
rm(list=c("toyDataDF", "disV"))



