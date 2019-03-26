library(ManifoldOptim)


### Name: Problem definition
### Title: Problem definition
### Aliases: 'Problem definition'

### ** Examples

## Not run: 
##D # --- Example 1: Define a problem in R ---
##D f <- function(x) { ... }
##D g <- function(x) { ... }
##D mod <- Module("ManifoldOptim_module", PACKAGE = "ManifoldOptim")
##D prob <- new(mod$RProblem, f, g)
##D 
##D # --- Example 2: Define a problem in R without specifying gradient ---
##D f <- function(x) { ... }
##D mod <- Module("ManifoldOptim_module", PACKAGE = "ManifoldOptim")
##D prob <- new(mod$RProblem, f)
##D 
##D # --- Example 3: Instantiate a problem written in C++ ---
##D p <- 5; n <- 150
##D B <- matrix(rnorm(n*n), nrow=n)
##D B <- B + t(B) # force symmetric
##D D <- diag(p:1, p)
##D Rcpp::sourceCpp("brockett_problem.cpp")
##D prob <- new(BrockettProblem, B, D)
## End(Not run)




