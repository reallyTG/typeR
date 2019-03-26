library(MOST)


### Name: FactorialPowerPlan
### Title: sample size, power and effect size calculations for a factorial
###   or fractional factorial experiment
### Aliases: FactorialPowerPlan

### ** Examples

FactorialPowerPlan(assignment="independent",
                   model_order=2,
                   nfactors=5,
                   ntotal=300,
                   raw_main=3,
                   sigma_y=10)

FactorialPowerPlan(assignment="independent",
                   model_order=2,
                   nfactors=5,
                   ntotal=300,
                   pre_post_corr=.6,
                   pretest="covariate",
                   raw_main=3,
                   sigma_y=10)




