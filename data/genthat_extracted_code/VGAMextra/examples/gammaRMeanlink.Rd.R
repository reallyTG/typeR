library(VGAMextra)


### Name: gammaRMeanlink
### Title: Link functions for the mean of 2-parameter continuous
###   distributions: The Gamma distribution.
### Aliases: gammaRMeanlink

### ** Examples

 
    alpha <- 0.1 + 1:8  # theta1
    rate  <- exp(1)     # theta2
 
 ## E1. gammaRMeanlink() and its inverse ##
    eta1  <- gammaRMeanlink(theta = alpha, rate = rate, inverse = FALSE)
    my.diff <- alpha - gammaRMeanlink(theta = eta1, rate = rate, inverse = TRUE)
    
    summary(my.diff)     # Zero
    
  ## E2. Special values arranged in a matrix ##
    rate <- matrix(rate, ncol = 3, nrow = 3)  #Ensure equal dimensions. 
    alpha <- matrix(c(Inf, -Inf, NA, NaN, -1 , 1, 0, -2, 2), ncol = 3, nrow = 3)
    gammaRMeanlink(theta = alpha, rate = rate)   # NaNs produced.
    
     
  ## E3. Special values arranged in a array ##
    dim(rate) <- NULL
    rate <- array(rate, dim = c(2, 2, 2))  #Ensure equal dimensions. 
    alpha <- array(0.1 + 1:8, dim = c(2, 2, 2))
    gammaRMeanlink(theta = alpha, rate = rate)
  



