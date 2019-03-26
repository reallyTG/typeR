library(assertr)


### Name: within_n_sds
### Title: Return a function to create z-score checking predicate
### Aliases: within_n_sds

### ** Examples

test.vector <- rnorm(100, mean=100, sd=20)

within.one.sd <- within_n_sds(1)
custom.bounds.checker <- within.one.sd(test.vector)
custom.bounds.checker(105)     # returns TRUE
custom.bounds.checker(40)      # returns FALSE

# same as
within_n_sds(1)(test.vector)(40)    # returns FALSE

within_n_sds(2)(test.vector)(as.numeric(NA))  # returns TRUE
# because, by default, within_bounds() will accept
# NA values. If we want to reject NAs, we have to
# provide extra arguments to this function
within_n_sds(2, allow.na=FALSE)(test.vector)(as.numeric(NA))  # returns FALSE

# or in a pipeline, like this was meant for

library(magrittr)

iris %>%
  insist(within_n_sds(5), Sepal.Length)




