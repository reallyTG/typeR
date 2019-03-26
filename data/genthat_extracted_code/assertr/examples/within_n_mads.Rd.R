library(assertr)


### Name: within_n_mads
### Title: Return a function to create robust z-score checking predicate
### Aliases: within_n_mads

### ** Examples

test.vector <- rnorm(100, mean=100, sd=20)

within.one.mad <- within_n_mads(1)
custom.bounds.checker <- within.one.mad(test.vector)
custom.bounds.checker(105)     # returns TRUE
custom.bounds.checker(40)      # returns FALSE

# same as
within_n_mads(1)(test.vector)(40)    # returns FALSE

within_n_mads(2)(test.vector)(as.numeric(NA))  # returns TRUE
# because, by default, within_bounds() will accept
# NA values. If we want to reject NAs, we have to
# provide extra arguments to this function
within_n_mads(2, allow.na=FALSE)(test.vector)(as.numeric(NA))  # returns FALSE

# or in a pipeline, like this was meant for

library(magrittr)

iris %>%
  insist(within_n_mads(5), Sepal.Length)




