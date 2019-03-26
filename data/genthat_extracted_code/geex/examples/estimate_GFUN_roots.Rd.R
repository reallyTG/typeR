library(geex)


### Name: estimate_GFUN_roots
### Title: Estimate roots for a set of estimating equations
### Aliases: estimate_GFUN_roots

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

# Add a control for the root solver
mycontrol <- new('geex_control', .root = setup_root_control(start = c(1, 1)))
mybasis@.control <- mycontrol

# Now estimate roots of GFUN
roots <- estimate_GFUN_roots(mybasis)
roots




