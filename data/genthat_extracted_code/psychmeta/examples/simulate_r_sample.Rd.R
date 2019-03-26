library(psychmeta)


### Name: simulate_r_sample
### Title: Simulation of data with measurement error and range-restriction
###   artifacts
### Aliases: simulate_r_sample
### Keywords: datagen

### ** Examples

## Generate data for a simple sample with two variables:
simulate_r_sample(n = 1000, rho_mat = matrix(c(1, .5, .5, 1), 2, 2),
          rel_vec = c(.8, .8), sr_vec = c(1, .5), var_names = c("Y", "X"))

## Generate data for samples with five variables, of which subsets are used to form composites:
rho_mat <- matrix(.5, 5, 5)
diag(rho_mat) <- 1

## Simulate parameters by supply n = Inf
simulate_r_sample(n = Inf, rho_mat = rho_mat,
                rel_vec = rep(.8, 5), sr_vec = c(1, 1, 1, 1, .5),
                wt_mat = cbind(c(0, 0, 0, .3, 1), c(1, .3, 0, 0, 0)), sr_composites = c(.7, .5))

## Finite sample sizes allow the generation of sample data
simulate_r_sample(n = 1000, rho_mat = rho_mat,
                rel_vec = rep(.8, 5), sr_vec = c(1, 1, 1, 1, .5),
                wt_mat = cbind(c(0, 0, 0, .3, 1), c(1, .3, 0, 0, 0)), sr_composites = c(.7, .5))



