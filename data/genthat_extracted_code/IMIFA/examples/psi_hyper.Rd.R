library(IMIFA)


### Name: psi_hyper
### Title: Find sensible inverse gamma hyperparameters for
###   variance/uniqueness parameters
### Aliases: psi_hyper
### Keywords: utility

### ** Examples

data(olive)
olive2  <- olive[,-(1:2)]
(scale1 <- psi_hyper(shape=2.5, dat=olive2))

# Try again with scaled data
olive_S <- scale(olive2, center=TRUE, scale=TRUE)

# Use the inverse of the sample covariance matrix
(scale2 <- psi_hyper(shape=2.5, dat=olive_S))

# Use the estimated inverse covariance matrix
(scale3 <- psi_hyper(shape=2.5, dat=olive_S, beta0=3))

# In the normalised example, the mean uniquenesses (given by scale/(shape - 1)),
# can be interpreted as the prior proportion of the variance that is idiosyncratic
(prop1   <- scale1/(2.5 - 1))
(prop2   <- scale2/(2.5 - 1))



