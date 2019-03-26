library(dplyr)


### Name: new_grouped_df
### Title: Low-level construction and validation for the grouped_df class
### Aliases: new_grouped_df validate_grouped_df
### Keywords: internal

### ** Examples

# 5 bootstrap samples
tbl <- new_grouped_df(
  tibble(x = rnorm(10)),
  groups = tibble(".rows" := replicate(5, sample(1:10, replace = TRUE), simplify = FALSE))
)
# mean of each bootstrap sample
summarise(tbl, x = mean(x))




