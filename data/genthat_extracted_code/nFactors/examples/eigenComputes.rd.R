library(nFactors)


### Name: eigenComputes
### Title: Computes Eigenvalues According to the Data Type
### Aliases: eigenComputes
### Keywords: multivariate

### ** Examples

# .......................................................
# Different data types
# Vector of eigenvalues
  data(dFactors)
  x1 <- dFactors$Cliff1$eigenvalues
  eigenComputes(x1)
  
# Data from a data.frame
  x2 <- data.frame(matrix(20*rnorm(100), ncol=5))
  eigenComputes(x2, cor=TRUE,  use="everything")
  eigenComputes(x2, cor=FALSE, use="everything")
  eigenComputes(x2, cor=TRUE,  use="everything", method="spearman")
  eigenComputes(x2, cor=TRUE,  use="everything", method="kendall")

# From a covariance matrix
  x3 <- cov(x2)
  eigenComputes(x3, cor=TRUE,  use="everything")
  eigenComputes(x3, cor=FALSE, use="everything")

# From a correlation matrix
  x4 <- cor(x2)
  eigenComputes(x4, use="everything")
# .......................................................
 


