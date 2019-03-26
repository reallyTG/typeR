library(VGAMextra)


### Name: inv.chisqMeanlink
### Title: Link functions for the mean of 1-parameter continuous
###   distributions: The inverse chi-squared distribution.
### Aliases: inv.chisqMeanlink inv.chisqMlink

### ** Examples

 ##  E1. Modelling the mean of the exponential distribution  ##
    set.seed(17010502)
    dof <- 2.5 
    isq.data <- data.frame(x2 = runif(100, 0, 1))
    isq.data <- transform(isq.data, y = rinv.chisq(n = 100, df = dof + x2))
    
    ## No test: 
    hist(isq.data$y)
    
## End(No test)
    
    fit.inv <- vglm(y ~ x2, family = inv.chisq(link = "inv.chisqMeanlink"), 
                    data = isq.data, trace = TRUE )
    coef(fit.inv, matrix = TRUE)
    summary(fit.inv)

  ## E3. Special values in a matrix ##
    (theta <- matrix(c(Inf, -Inf, NA, NaN, 1 , 2, 3, 4), ncol = 4, nrow = 2))
    inv.chisqMeanlink(theta = theta)   ## NaNs for df = theta <= 2 
 
  ## E2. inv.chisqMeanlink() and its inverse ##
    theta <- 0.1 + 1:5  # dof = df
    my.diff <- theta - inv.chisqMeanlink(inv.chisqMeanlink(theta = theta), inverse  =TRUE)
    summary(my.diff)     # Zero




