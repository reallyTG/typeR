library(pifpaf)


### Name: check.cft
### Title: Check that expected value of counterfactual decreases exposure
###   levels
### Aliases: check.cft
### Keywords: internal

### ** Examples


#Example 1 
cft <- function(X){0.5*X}
X   <- runif(100, 0,2)
check.cft(cft, X)




