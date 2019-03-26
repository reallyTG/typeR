library(wdm)


### Name: wdm
### Title: Weighted Dependence Measures
### Aliases: wdm

### ** Examples

##  dependence between two vectors
x <- rnorm(100)
y <- rpois(100, 1)  # all but Hoeffding's D can handle ties
w <- runif(100)
wdm(x, y, method = "kendall")               # unweighted
wdm(x, y, method = "kendall", weights = w)  # weighted

##  dependence in a matrix
x <- matrix(rnorm(100 * 3), 100, 3)
wdm(x, method = "spearman")               # unweighted
wdm(x, method = "spearman", weights = w)  # weighted

##  dependence between columns of two matrices
y <- matrix(rnorm(100 * 2), 100, 2)
wdm(x, y, method = "hoeffding")               # unweighted
wdm(x, y, method = "hoeffding", weights = w)  # weighted




