library(l2boost)


### Name: elasticNetSim
### Title: A blocked correlated data simulation.
### Aliases: elasticNetSim

### ** Examples

#--------------------------------------------------------------------------
# Example: Elastic net simulation
#  
# For elastic net simulation data, see Zou, H. and Hastie, T. (2005) 
# Regularization and variable selection via the elastic net J. R. Statist. Soc. B
# , 67, Part 2, pp. 301-320
  # Set the RNG seed to create a reproducible simulation
  set.seed(432) # Takes an integer argument
  
  # Creata simulation with 100 observations.
  dta <- elasticNetSim(n=100)
  
  # The simulation contains a design matrix x, and response vector y
  dim(dta$x)
  length(dta$y)
  print(dta$x[1:5,])




