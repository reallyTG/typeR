library(IncDTW)


### Name: simulate_timewarp
### Title: Simulate time warp
### Aliases: simulate_timewarp
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(123)
##D x <- cumsum(rnorm(100))
##D x_new <- simulate_timewarp(x, stretch = 0.1, compress = 0.2, seed = 123) 
##D plot(x, type = "l")
##D lines(x_new, col = "red")
##D 
##D y <- matrix(cumsum(rnorm(10^3)), ncol = 2)
##D 
##D 
##D # insert NA with uniform distributions
##D y_warp <- simulate_timewarp(y, stretch = 0.2, p_number = "runif", p_index = "runif",
##D                           stretch_method = insert_const, 
##D                           const = NA)
##D matplot(y_warp, type = "l")
##D 
##D 
##D # insert NA with log-normal distribution
##D y_warp <- simulate_timewarp(y, stretch = 0.2, p_number = "rlnorm", 
##D                           p_number_list = list(meanlog = 0, sdlog = 1),
##D                           stretch_method = insert_const, 
##D                           const = NA)
##D matplot(y_warp, type = "l")
##D 
##D 
##D # insert linear interpolation
##D y_warp <- simulate_timewarp(y, stretch = 0.2, p_number = "rlnorm", 
##D                           stretch_method = insert_linear_interp)
##D matplot(y_warp, type = "l")
##D 
##D 
##D # insert random walk with gaussian noise
##D y_warp <- simulate_timewarp(y, stretch = 0.2, p_number = "rlnorm", 
##D                           stretch_method = insert_norm,
##D                           sd = 1, mean = 0)
##D matplot(y_warp, type = "l")
##D 
##D 
##D # insert constant, only 1 observation per random index
##D y_warp <- simulate_timewarp(y, stretch = 0.2, p_number = "runif", p_index = "runif",
##D                             p_number_list = list(min=1, max=1),   
##D                             stretch_method = insert_const)
##D matplot(y_warp, type = "l")
##D 
## End(Not run)



