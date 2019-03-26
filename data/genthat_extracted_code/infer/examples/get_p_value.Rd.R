library(infer)


### Name: get_p_value
### Title: Compute p-value
### Aliases: get_p_value get_pvalue

### ** Examples

# Prepare the dataset
mtcars_df <- mtcars %>%
  dplyr::mutate(am = factor(am))

# Calculate the difference in means in the dataset
d_hat <- mtcars_df %>%
  specify(mpg ~ am) %>%
  calculate(stat = "diff in means", order = c("1", "0"))

# Same calculation on 100 permutation replicates
null_distn <- mtcars_df %>%
  specify(mpg ~ am) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 100) %>%
  calculate(stat = "diff in means", order = c("1", "0"))

# What proportion of replicates had a difference
# in means more extreme than in the dataset?
null_distn %>%
  get_p_value(obs_stat = d_hat, direction = "right")



