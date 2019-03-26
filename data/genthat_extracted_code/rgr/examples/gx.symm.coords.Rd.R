library(rgr)


### Name: gx.symm.coords
### Title: Computation of Symmetric Coordinates
### Aliases: gx.symm.coords
### Keywords: multivariate manip

### ** Examples

## Make test data available
data(nockolds)

## Compute and display symmetric coordinates for the first two columns 
## of the data
gx.symm.coords(as.matrix(nockolds))

## Clean-up
rm(nockolds)



