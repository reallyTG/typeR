library(mipfp)


### Name: mipfp-package
### Title: Multidimensional Iterative Proportional Fitting and Alternative
###   Models
### Aliases: mipfp-package mipfp
### Keywords: models multivariate array distribution package

### ** Examples

# generation of an intial 2-ways table to be updated
seed <- array(1, dim=c(2, 2))
# desired targets (margins)
target.row <- c(87, 13)
target.col <- c(52, 48)
# storing the margins in a list
target.data <- list(target.col, target.row)
# list of dimensions of each marginal constrain
target.list <- list(1, 2)
# calling the fitting methods
r.ipfp <- Ipfp(seed, target.list, target.data)
r.ml <- ObtainModelEstimates(seed, target.list, target.data, method = "ml")
r.chi2 <- ObtainModelEstimates(seed, target.list, target.data, method = "chi2")
r.lsq <- ObtainModelEstimates(seed, target.list, target.data, method = "lsq")



