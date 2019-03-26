library(kernDeepStackNet)


### Name: getEigenValuesRcpp
### Title: Calculates the eigenvalues of a matrix
### Aliases: getEigenValuesRcpp
### Keywords: models & regression

### ** Examples

# Define simple binary matrix
M <- cbind(c(1,-1), c(-1,1))

# Calculate eigen values with standard function
eigenVal <- eigen(M, only.values=TRUE)$values

# Calculate eigen values with Rcpp version
eigenValRcpp <- rev(getEigenValuesRcpp(M))

# Check equality
all.equal(eigenVal, eigenValRcpp) # TRUE

# Analyse run time of both variants
if(tryCatch(require("microbenchmark", quietly=TRUE, warn.conflicts=FALSE, 
character.only = TRUE), warning=function(w) FALSE, error=function(e) FALSE)) {
  microbenchmark(Standard=eigen(M, only.values=TRUE), Rcpp=getEigenValuesRcpp(M))
}
# -> Rcpp function is on average about 30 times faster than the standard R function



