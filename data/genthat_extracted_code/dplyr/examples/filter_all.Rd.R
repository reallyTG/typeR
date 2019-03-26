library(dplyr)


### Name: filter_all
### Title: Filter within a selection of variables
### Aliases: filter_all filter_if filter_at

### ** Examples

# While filter() accepts expressions with specific variables, the
# scoped filter verbs take an expression with the pronoun `.` and
# replicate it over all variables. This expression should be quoted
# with all_vars() or any_vars():
all_vars(is.na(.))
any_vars(is.na(.))


# You can take the intersection of the replicated expressions:
filter_all(mtcars, all_vars(. > 150))

# Or the union:
filter_all(mtcars, any_vars(. > 150))


# You can vary the selection of columns on which to apply the
# predicate. filter_at() takes a vars() specification:
filter_at(mtcars, vars(starts_with("d")), any_vars((. %% 2) == 0))

# And filter_if() selects variables with a predicate function:
filter_if(mtcars, ~ all(floor(.) == .), all_vars(. != 0))


# We're working on a new syntax to allow functions instead,
# including purrr-like lambda functions. This is already
# operational, but there's currently no way to specify the union of
# the predicate results:
mtcars %>% filter_at(vars(hp, vs), ~ . %% 2 == 0)



