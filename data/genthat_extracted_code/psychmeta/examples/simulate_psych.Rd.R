library(psychmeta)


### Name: simulate_psych
### Title: Simulate Monte Carlo psychometric data (observed, true, and
###   error scores)
### Aliases: simulate_psych
### Keywords: datagen

### ** Examples

## Generate data for a simple sample with two variables without selection:
simulate_psych(n = 1000, rho_mat = matrix(c(1, .5, .5, 1), 2, 2), sigma_vec = c(1, 1),
          rel_vec = c(.8, .8), var_names = c("Y", "X"))

## Generate data for a simple sample with two variables with selection:
simulate_psych(n = 1000, rho_mat = matrix(c(1, .5, .5, 1), 2, 2), sigma_vec = c(1, 1),
          rel_vec = c(.8, .8), sr_vec = c(1, .5), var_names = c("Y", "X"))

## Generate data for samples with five variables, of which subsets are used to form composites:
rho_mat <- matrix(.5, 5, 5)
diag(rho_mat) <- 1
simulate_psych(n = 1000, rho_mat = rho_mat,
                rel_vec = rep(.8, 5), sr_vec = c(1, 1, 1, 1, .5),
                wt_mat = cbind(c(0, 0, 0, .3, 1), c(1, .3, 0, 0, 0)), sr_composites = c(.7, .5))

## Generate data for similar scenario as above, but with scales consisting of 1-5 items:
rho_mat <- matrix(.5, 5, 5)
diag(rho_mat) <- 1
simulate_psych(n = 1000, rho_mat = rho_mat,
                rel_vec = rep(.8, 5), sr_vec = c(1, 1, 1, 1, .5),
                k_items_vec = 1:5,
                wt_mat = cbind(c(0, 0, 0, .3, 1), c(1, .3, 0, 0, 0)), sr_composites = c(.7, .5))



