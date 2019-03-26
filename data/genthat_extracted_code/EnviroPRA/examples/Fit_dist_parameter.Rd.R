library(EnviroPRA)


### Name: Fit_dist_parameter
### Title: Returns adjusted distribution parameters
### Aliases: Fit_dist_parameter
### Keywords: methods

### ** Examples


a <- rnorm(n=100, mean =10, sd = 1) 

b <- Fit_dist_parameter(a)

# Examples of result extraction

b$normal

b$weibull



