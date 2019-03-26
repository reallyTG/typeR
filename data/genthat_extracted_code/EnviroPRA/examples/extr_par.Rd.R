library(EnviroPRA)


### Name: extr_par
### Title: Extracts the fitted distribution parameters to be introduced in
###   other function
### Aliases: extr_par
### Keywords: methods

### ** Examples

a <- rnorm(n=100, mean =10, sd = 1) 

b <- Fit_dist_parameter(a)

extr_par(x = b, dist ="norm")




