library(rgr)


### Name: gx.rqpca.loadplot
### Title: Function to Graphically Display PCA Loadings
### Aliases: gx.rqpca.loadplot
### Keywords: hplot

### ** Examples

## Make test data available
data(sind.mat2open)

## Estimate and display robust PCA loadings
sind.save <- gx.robmva.closed(sind.mat2open)
gx.rqpca.loadplot(sind.save)

## Clean-up
rm(sind.save)



