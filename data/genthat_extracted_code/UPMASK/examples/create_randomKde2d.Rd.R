library(UPMASK)


### Name: create_randomKde2d
### Title: Compute the density based distance quantity using a 2D Kernel
###   Density Estimation
### Aliases: create_randomKde2d
### Keywords: utilities

### ** Examples

# Compute the density based distance quantity with random fields
distVar <- create_randomKde2d(100, 10, 10, showStats=FALSE,
                              printPlots=FALSE, returnDistance=TRUE)

# Clean the environment
rm(distVar)



