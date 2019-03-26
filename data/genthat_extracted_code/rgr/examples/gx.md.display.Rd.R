library(rgr)


### Name: gx.md.display
### Title: Function to Display Membership Probabilities and Other Relevant
###   Data
### Aliases: gx.md.display
### Keywords: print

### ** Examples

## Make test data available
data(sind.mat2open)
data(sind)
attach(sind)
## data frame sind attached to provide access to row IDs

## Estimate and default display robust Mahalanobis distances
sind.save <- gx.robmva.closed(sind.mat2open)
xx <- cbind(sind.save$md, sind.save$ppm, E, N, Cu, Zn)
gx.md.display(xx)

## Save display for future use in the Working Directory
gx.md.display(xx, file = " ")

## Clean-up
rm(sind.save)
rm(xx)
detach(sind)



