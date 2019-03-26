library(geex)


### Name: estimate_sandwich_matrices
### Title: Estimate component matrices of the empirical sandwich covariance
###   estimator
### Aliases: estimate_sandwich_matrices

### ** Examples


myee <- function(data){
  function(theta){
    c(data$Y1 - theta[1],
     (data$Y1 - theta[1])^2 - theta[2])
   }
 }

# Start with a basic basis
mybasis <- create_basis(
  estFUN = myee,
  data   = geexex)

# Now estimate sandwich matrices
estimate_sandwich_matrices(
 mybasis, c(mean(geexex$Y1), var(geexex$Y1)))



