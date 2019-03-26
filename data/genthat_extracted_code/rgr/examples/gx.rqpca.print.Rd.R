library(rgr)


### Name: gx.rqpca.print
### Title: Function to Display PCA Loadings and Scores
### Aliases: gx.rqpca.print
### Keywords: print

### ** Examples

## Make test data available
data(sind.mat2open)

## Estimate and display robust PCA loadings and scores
sind.save <- gx.robmva.closed(sind.mat2open)
gx.rqpca.print(sind.save, ifcntrb = TRUE)

## Clean-up
rm(sind.save)



