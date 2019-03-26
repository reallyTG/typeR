library(nFactors)


### Name: eigenFrom
### Title: Identify the Data Type to Obtain the Eigenvalues
### Aliases: eigenFrom
### Keywords: multivariate

### ** Examples

# .......................................................
# Different data types
# Examples of adequate data sources
# Vector of eigenvalues
  data(dFactors)
  x1 <- dFactors$Cliff1$eigenvalues
  eigenFrom(x1)
  
# Data from a data.frame
  x2 <- data.frame(matrix(20*rnorm(100), ncol=5))
  eigenFrom(x2)

# From a covariance matrix
  x3 <- cov(x2)
  eigenFrom(x3)

# From a correlation matrix
  x4 <- cor(x2)
  eigenFrom(x4)

# Examples of inadequate data sources: not run because of errors generated
  # x0 <- c(2,1)             # Error: not enough eigenvalues
  # eigenFrom(x0)
  # x2 <- matrix(x1, ncol=5) # Error: non a symetric covariance matrix
  # eigenFrom(x2)
  # eigenFrom(x3[,(1:2)])    # Error: not enough variables
  # x6 <- table(x5)          # Error: not a valid data class
  # eigenFrom(x6)
# .......................................................
 


