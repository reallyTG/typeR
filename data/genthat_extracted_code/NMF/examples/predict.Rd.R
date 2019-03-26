library(NMF)


### Name: predict
### Title: Clustering and Prediction
### Aliases: predict predict-methods predict,NMFfitX-method
###   predict,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# random target matrix
v <- rmatrix(20, 10)
# fit an NMF model
x <- nmf(v, 5)

# predicted column and row clusters
predict(x)
predict(x, 'rows')

# with relative contributions of each basis component
predict(x, prob=TRUE)
predict(x, 'rows', prob=TRUE)



