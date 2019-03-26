library(causaldrf)


### Name: scalar_wts
### Title: This function calculates scalar weights for use in other models
### Aliases: scalar_wts

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

scalar_wts_list <- scalar_wts(treat = T,
                     treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                     numerator_formula = T ~ 1,
                     data = example_data,
                     treat_mod = "Normal")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
     scalar_wts_list$weights[sample_index],
     xlab = "T",
     ylab = "weights",
     main = "scalar_wts")


rm(example_data, scalar_wts_list, sample_index)



