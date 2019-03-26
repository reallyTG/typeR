library(rgr)


### Name: gx.rqpca.save
### Title: Function to Save PCA Loadings and Scores as .csv files
### Aliases: gx.rqpca.save
### Keywords: IO

### ** Examples

## Make test data available
data(sind.mat2open)

## Estimate and save robust PCA loadings and scores
sind.save <- gx.robmva.closed(sind.mat2open)
gx.rqpca.save(sind.save)

## NOTE: the example below is commented out
## Save PCA scores for future use
## gx.rqpca.save(sind.save, ifcntrb = TRUE, file = "D:\R_work\Project3")

## Clean-up
rm(sind.save)



