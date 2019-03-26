library(NCmisc)


### Name: which.outlier
### Title: Return vector indexes of statistical univariate outliers
### Aliases: which.outlier

### ** Examples

test.vec <- rnorm(200)
summary(test.vec)
ii <- which.outlier(test.vec) # 2 SD outliers
prv(ii); vals <- test.vec[ii]; prv(vals)
ii <- which.outlier(test.vec,1.5,"iq") # e.g, 'stars' on a box-plot
prv(ii)
ii <- which.outlier(test.vec,5,"pc",low=FALSE) # only outliers >mean
prv(ii)



