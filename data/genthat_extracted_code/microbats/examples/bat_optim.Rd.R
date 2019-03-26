library(microbats)


### Name: bat_optim
### Title: Bat Algorithm
### Aliases: bat_optim

### ** Examples

# find the x-value that gives the minimum of the quadratic function y = x^2 - 3x
# x should then be 1.5
quad_func <- function(D, sol) {
 val = 0
 for (i in 1:D) {
   val <- val + sol[i] * sol[i] - sol[i] * 3
 }
 return(val)
}

# run a simulation using the standard bat algorithm
set.seed(5)  # for reproducive results
fit <- bat_optim(D = 1, NP = 20, N_Gen = 100, A = 0.5, r = 0.5,
                 Qmin = 0, Qmax = 2, Lower = -10, Upper = 10, FUN = quad_func)
x <- fit$best_solution




