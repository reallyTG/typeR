library(h2o)


### Name: dimnames.H2OFrame
### Title: Column names of an H2OFrame
### Aliases: dimnames.H2OFrame

### ** Examples

## No test: 
h2o.init()
n <- 2000
#  Generate variables V1, ... V10
X <- matrix(rnorm(10 * n), n, 10)
#  y = +1 if sum_i x_{ij}^2 > chisq median on 10 df
y <- rep(-1, n)
y[apply(X*X, 1, sum) > qchisq(.5, 10)] <- 1
#  Assign names to the columns of X:
dimnames(X)[[2]] <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10")
## End(No test)



