library(GEint)


### Name: GE_BICS_old
### Title: GE_BICS_old.R
### Aliases: GE_BICS_old

### ** Examples

E <- rnorm(n=500)
G <- rbinom(n=500, size=2, prob=0.3)
design_mat <- cbind(1, G, E, G*E)
outcome <- rnorm(500)
GE_BICS_old(outcome=outcome, design_mat=design_mat, desired_coef=4, outcome_type='C')



