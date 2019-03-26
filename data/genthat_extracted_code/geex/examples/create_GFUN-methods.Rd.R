library(geex)


### Name: create_GFUN
### Title: Creates a function that sums over psi functions
### Aliases: create_GFUN create_GFUN,m_estimation_basis-method
###   create_GFUN,m_estimation_basis,m_estimation_basis-method

### ** Examples

myee <- function(data){
   function(theta){
    c(data$Y1 - theta[1],
     (data$Y1 - theta[1])^2 - theta[2])
   }
 }
mybasis <- create_basis(
   estFUN = myee,
   data   = geexex)
f <- grab_GFUN(create_GFUN(mybasis))

# Evaluate GFUN at mean and variance: should be close to zero
n <- nrow(geexex)
f(c(mean(geexex$Y1), var(geexex$Y1) * (n - 1)/n))





