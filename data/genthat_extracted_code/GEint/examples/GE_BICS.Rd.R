library(GEint)


### Name: GE_BICS
### Title: GE_BICS.R
### Aliases: GE_BICS

### ** Examples

E <- rnorm(n=500)
G <- rbinom(n=500, size=2, prob=0.3)
design_mat <- cbind(1, G, E, G*E)
outcome <- rnorm(500)
GE_BICS(outcome=outcome, design_mat=design_mat, desired_coef=4, outcome_type='C')



