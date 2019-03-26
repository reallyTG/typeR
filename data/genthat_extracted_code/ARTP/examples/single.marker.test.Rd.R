library(ARTP)


### Name: single.marker.test
### Title: Single SNP test
### Aliases: single.marker.test
### Keywords: model

### ** Examples


  # Generate data
  set.seed(123)
  n <- 1000
  y <- rbinom(n, 1, 0.5)
  snp <- rbinom(n, 2, 0.4)
  weights <- rep.int(1, times=n)
  offset  <- rep.int(0, times=n)
  control  <- glm.control()
 
  # Create a design matrix
  x <- matrix(data=NA, nrow=n, ncol=3)
  x[, 1] <- 1  # Intercept column
  x[, 2] <- runif(n) # Continuous covariate
  x[, 3] <- snp

  single.marker.test(y, x, weights, offset, control, 3)




