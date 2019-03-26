library(DeclareDesign)


### Name: simulate_design
### Title: Simulate a design
### Aliases: simulate_design simulate_designs

### ** Examples

my_population <- declare_population(N = 500, noise = rnorm(N))

my_potential_outcomes <- declare_potential_outcomes(
  Y_Z_0 = noise, Y_Z_1 = noise +
  rnorm(N, mean = 2, sd = 2))

my_assignment <- declare_assignment()

my_estimand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))

my_estimator <- declare_estimator(Y ~ Z, estimand = my_estimand)

my_reveal <- declare_reveal()

design <- my_population +
  my_potential_outcomes +
  my_estimand +
  my_assignment +
  my_reveal +
  my_estimator

## Not run: 
##D simulations <- simulate_design(designs, sims = 2)
##D diagnosis <- diagnose_design(simulations_df = simulations)
## End(Not run)

## Not run: 
##D # A fixed population with simulations over assignment only
##D head(simulate_design(design, sims = c(1, 1, 1, 100, 1)))
## End(Not run)




