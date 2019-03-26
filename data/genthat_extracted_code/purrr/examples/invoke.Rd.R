library(purrr)


### Name: invoke
### Title: Invoke functions.
### Aliases: invoke invoke_map invoke_map_lgl invoke_map_int invoke_map_dbl
###   invoke_map_chr invoke_map_raw invoke_map_dfr invoke_map_dfc
###   invoke_map_df map_call
### Keywords: internal

### ** Examples

# Invoke a function with a list of arguments
invoke(runif, list(n = 10))
# Invoke a function with named arguments
invoke(runif, n = 10)

# Combine the two:
invoke(paste, list("01a", "01b"), sep = "-")
# That's more natural as part of a pipeline:
list("01a", "01b") %>%
  invoke(paste, ., sep = "-")

# Invoke a list of functions, each with different arguments
invoke_map(list(runif, rnorm), list(list(n = 10), list(n = 5)))
# Or with the same inputs:
invoke_map(list(runif, rnorm), list(list(n = 5)))
invoke_map(list(runif, rnorm), n = 5)
# Or the same function with different inputs:
invoke_map("runif", list(list(n = 5), list(n = 10)))

# Or as a pipeline
list(m1 = mean, m2 = median) %>% invoke_map(x = rcauchy(100))
list(m1 = mean, m2 = median) %>% invoke_map_dbl(x = rcauchy(100))

# Note that you can also match by position by explicitly omitting `.x`.
# This can be useful when the argument names of the functions are not
# identical
list(m1 = mean, m2 = median) %>%
  invoke_map(, rcauchy(100))

# If you have pairs of function name and arguments, it's natural
# to store them in a data frame. Here we use a tibble because
# it has better support for list-columns
if (rlang::is_installed("tibble")) {
  df <- tibble::tibble(
    f = c("runif", "rpois", "rnorm"),
    params = list(
      list(n = 10),
      list(n = 5, lambda = 10),
      list(n = 10, mean = -3, sd = 10)
    )
  )
  df
  invoke_map(df$f, df$params)
}



