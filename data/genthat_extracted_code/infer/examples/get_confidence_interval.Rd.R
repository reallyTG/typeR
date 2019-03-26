library(infer)


### Name: get_confidence_interval
### Title: Compute confidence interval
### Aliases: get_confidence_interval get_ci

### ** Examples

# Prepare the dataset
mtcars_df <- mtcars %>%
  dplyr::mutate(am = factor(am))

# Calculate the difference in means in the dataset
d_hat <- mtcars_df %>%
  specify(mpg ~ am) %>%
  calculate(stat = "diff in means", order = c("1", "0"))

# Same calculation on 100 bootstrap replicates
bootstrap_distn <- mtcars_df %>%
  specify(mpg ~ am) %>%
  generate(reps = 100, type = "bootstrap") %>%
  calculate(stat = "diff in means", order = c("1", "0"))

# Use level to set the confidence level
bootstrap_distn %>%
  get_confidence_interval(level = 0.9)

# To calculate std error, set the type and point estimate
bootstrap_distn %>%
  get_confidence_interval(type = "se", point_estimate = d_hat)



