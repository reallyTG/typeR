library(RcppAPT)


### Name: showSrc
### Title: Display information for given packages
### Aliases: showSrc

### ** Examples

showSrc("^r-(base|doc)-")
showSrc("r-cran-rcpp")  # also finds RcppEigen and RcppArmadillo
showSrc("r-cran-rcpp$") # just Rcpp



