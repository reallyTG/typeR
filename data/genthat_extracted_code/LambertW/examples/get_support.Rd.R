library(LambertW)


### Name: get_support
### Title: Computes support for skewed Lambert W x F distributions
### Aliases: get_support
### Keywords: math

### ** Examples


get_support(c(mu_x = 0, sigma_x = 1, gamma = 0)) # as gamma = 0
# truncated on the left since gamma > 0
get_support(c(mu_x = 0, sigma_x = 1, gamma = 0.1)) 

# no truncation for heavy tail(s)
get_support(c(mu_x = 0, sigma_x = 1, delta = 0.1))



