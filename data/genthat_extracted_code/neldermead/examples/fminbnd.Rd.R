library(neldermead)


### Name: fminbnd
### Title: Computation of the constrained minimimum of given function with
###   the Nelder-Mead algorithm.
### Aliases: fminbnd
### Keywords: method

### ** Examples

#In the following example, we use the fminbnd function to compute the minimum
#of a quadratic function. We first define the function 'quad', and then use
#the fminbnd function to search the minimum, starting with the initial guess
#(1.2, 1.9) and bounds of (1, 1) and (2, 2). In this particular case, 11 
#iterations are performed with 20 function evaluations
  quad <- function(x){
    y <- x[1]^2 + x[2]^2
  }
  sol <- fminbnd(quad,c(1.2,1.9),c(1,1),c(2,2))
  summary(sol)



