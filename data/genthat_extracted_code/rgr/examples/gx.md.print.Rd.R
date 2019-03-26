library(rgr)


### Name: gx.md.print
### Title: Function to Display Membership Probabilities
### Aliases: gx.md.print
### Keywords: print

### ** Examples

## Make test data available
data(sind.mat2open)

## Estimate and display robust Mahalanobis distances
sind.save <- gx.robmva.closed(sind.mat2open)
gx.md.print(sind.save, pcut = 0.3)

## Save display for future use, not executed
## gx.md.print(sind.save, ifprint = FALSE, file = "D://R_work//Project3")

## Clean-up
rm(sind.save)



