library(causaldrf)


### Name: overlap_fun
### Title: This function creates an overlapping dataset
### Aliases: overlap_fun

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

overlap_list <- overlap_fun(Y = Y,
                  treat = T,
                  treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                  data_set = example_data,
                  n_class = 3,
                  treat_mod = "Normal")

overlapped_data <- overlap_list$overlap_dataset
summary(overlapped_data)

rm(example_data, overlap_list, overlapped_data)



