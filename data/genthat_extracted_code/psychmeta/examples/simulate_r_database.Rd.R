library(psychmeta)


### Name: simulate_r_database
### Title: Simulate correlation databases of primary studies
### Aliases: simulate_r_database
### Keywords: datagen

### ** Examples

## Note the varying methods for defining parameters:
n_params = function(n) rgamma(n, shape = 100)
rho_params <- list(c(.1, .3, .5),
                   c(mean = .3, sd = .05),
                   rbind(value = c(.1, .3, .5), weight = c(1, 2, 1)))
rel_params = list(c(.7, .8, .9),
                  c(mean = .8, sd = .05),
                  rbind(value = c(.7, .8, .9), weight = c(1, 2, 1)))
sr_params = c(list(1, 1, c(.5, .7)))
sr_composite_params = list(1, c(.5, .6, .7))
wt_params = list(list(c(1, 2, 3),
                      c(mean = 2, sd = .25),
                      rbind(value = c(1, 2, 3), weight = c(1, 2, 1))),
                 list(c(1, 2, 3),
                      c(mean = 2, sd = .25),
                      cbind(value = c(1, 2, 3), weight = c(1, 2, 1))))

## Simulate with long format
simulate_r_database(k = 10, n_params = n_params, rho_params = rho_params,
                  rel_params = rel_params, sr_params = sr_params,
                  sr_composite_params = sr_composite_params, wt_params = wt_params,
                  var_names = c("X", "Y", "Z"), format = "long")

## Simulate with wide format
simulate_r_database(k = 10, n_params = n_params, rho_params = rho_params,
                  rel_params = rel_params, sr_params = sr_params,
                  sr_composite_params = sr_composite_params, wt_params = wt_params,
                  var_names = c("X", "Y", "Z"), format = "wide")



