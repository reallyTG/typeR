library(psychmeta)


### Name: simulate_d_sample
### Title: Simulate a sample of psychometric d value data with measurement
###   error, direct range restriction, and/or indirect range restriction
### Aliases: simulate_d_sample

### ** Examples

## Simulate statistics by providing integers as "n_vec":
simulate_d_sample(n_vec = c(200, 100), rho_mat_list = list(reshape_vec2mat(.5),
                                                           reshape_vec2mat(.4)),
                  mu_mat = rbind(c(1, .5), c(0, 0)), sigma_mat = rbind(c(1, 1), c(1, 1)),
                  rel_mat = rbind(c(.8, .7), c(.7, .7)), sr_vec = c(1, .5),
                  group_names = c("A", "B"))

## Simulate parameters by providing proportions as "n_vec":
simulate_d_sample(n_vec = c(2/3, 1/3), rho_mat_list = list(reshape_vec2mat(.5),
                                                           reshape_vec2mat(.4)),
                  mu_mat = rbind(c(1, .5), c(0, 0)), sigma_mat = rbind(c(1, 1), c(1, 1)),
                  rel_mat = rbind(c(.8, .7), c(.7, .7)), sr_vec = c(1, .5),
                  group_names = c("A", "B"))



