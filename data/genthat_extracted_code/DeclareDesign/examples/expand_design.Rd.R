library(DeclareDesign)


### Name: expand_design
### Title: Declare a design via a designer
### Aliases: expand_design

### ** Examples


## Not run: 
##D 
##D # in conjunction with DesignLibrary
##D 
##D library(DesignLibrary)
##D 
##D designs <- expand_design(multi_arm_designer, outcome_means = list(c(3,2,4), c(1,4,1)))
##D 
##D # with a custom designer function
##D 
##D designer <- function(N) {
##D   pop <- declare_population(N = N, noise = rnorm(N))
##D   pos <- declare_potential_outcomes(Y ~ 0.20 * Z + noise)
##D   assgn <- declare_assignment(m = N / 2)
##D   mand <- declare_estimand(ATE = mean(Y_Z_1 - Y_Z_0))
##D   mator <- declare_estimator(Y ~ Z, estimand = mand)
##D   pop + pos + assgn + mand + mator
##D }
##D 
##D # returns list of eight designs
##D designs <- expand_design(designer, N = seq(30, 100, 10))
##D 
##D  # diagnose a list of designs created by expand_design or redesign
##D  diagnosis <- diagnose_design(designs, sims = 50)
##D 
##D # returns a single design
##D large_design <- expand_design(designer, N = 200)
##D 
##D  diagnose_large_design <- diagnose_design(large_design, sims = 50)
## End(Not run)




