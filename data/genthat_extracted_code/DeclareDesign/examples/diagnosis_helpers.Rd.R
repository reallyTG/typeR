library(DeclareDesign)


### Name: diagnosis_helpers
### Title: Explore your design diagnosis
### Aliases: diagnosis_helpers get_diagnosands get_simulations

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
##D # using built-in defaults:
##D diagnosis <- diagnose_design(design)
##D diagnosis
## End(Not run)

# using a user-defined diagnosand
my_diagnosand <- declare_diagnosands(absolute_error = mean(abs(estimate - estimand)))

## Not run: 
##D diagnosis <- diagnose_design(design, diagnosands = my_diagnosand)
##D diagnosis
##D 
##D get_diagnosands(diagnosis)
##D 
##D get_simulations(diagnosis)
##D 
##D reshape_diagnosis(diagnosis)
##D 
## End(Not run)




