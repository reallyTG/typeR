library(grouped)


### Name: power.grouped
### Title: Power and sample size calculations for grouped data
### Aliases: power.grouped
### Keywords: htest

### ** Examples
 

## Not run: 
##D  
##D power.grouped(n = NULL, X = NULL, m = 20, theta = c(0, 1, 0.7), 
##D     sigma = 1, type.power = "marginal", type.lik = "approximate", 
##D     gr.mech = "equispaced", dist.t = data.frame("bernoulli", 0.5, 1), 
##D     dist.x = data.frame("normal", 0, 1), power. = 0.7, limits = c(10,1000)) 
##D     # to get an initial search area using the approximate likelihood
##D 
##D power.grouped(n = NULL, X = NULL, m = 20, theta = c(0, 1, 0.7), 
##D     sigma = 1, type.power = "marginal", MC.iter = 20, gr.mech = "equispaced", 
##D     dist.t = data.frame("bernoulli", 0.5, 1), dist.x = data.frame("normal", 0, 1), 
##D     power. = 0.7, limits = c(10,50)) 
##D     # redefine the search area and use the original likelihood
## End(Not run)

power.grouped(n = 20, X = NULL, m = 20, theta = c(0, 1, 0.7), 
    sigma = 1, type.power = "marginal", gr.mech = "equispaced", 
    dist.t = data.frame("bernoulli", 0.5, 1), 
    dist.x = data.frame("normal", 0, 1), power. = NULL) 




