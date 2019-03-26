library(GA)


### Name: ga_pmutation
### Title: Variable mutation probability in genetic algorithms
### Aliases: ga_pmutation ga_pmutation_R ga_pmutation_Rcpp

### ** Examples

## Not run: 
##D Rastrigin <- function(x1, x2)
##D {
##D   20 + x1^2 + x2^2 - 10*(cos(2*pi*x1) + cos(2*pi*x2))
##D }
##D 
##D GA <- ga(type = "real-valued", 
##D          fitness =  function(x) -Rastrigin(x[1], x[2]),
##D          lower = c(-5.12, -5.12), upper = c(5.12, 5.12), 
##D          popSize = 50, maxiter = 500, run = 100,
##D          pmutation = ga_pmutation)
##D plot(GA)
##D 
##D GA <- ga(type = "real-valued", 
##D          fitness =  function(x) -Rastrigin(x[1], x[2]),
##D          lower = c(-5.12, -5.12), upper = c(5.12, 5.12), 
##D          popSize = 50, maxiter = 500, run = 100,
##D          pmutation = function(...) ga_pmutation(..., p0 = 0.1))
##D plot(GA)
## End(Not run)



