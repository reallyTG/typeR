library(causaldrf)


### Name: t_mod
### Title: A function to estimate conditional expected values and higher
###   order moments
### Aliases: t_mod

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

t_mod_list <- t_mod(treat = T,
                    treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                    data = example_data,
                    treat_mod = "Normal")

cond_exp_data <- t_mod_list$T_data

full_data <- cbind(example_data, cond_exp_data)

rm(example_data, t_mod_list, cond_exp_data, full_data)



