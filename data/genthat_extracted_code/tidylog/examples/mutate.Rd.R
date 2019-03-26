library(tidylog)


### Name: mutate
### Title: Wrapper around dplyr::mutate and related functions that prints
###   information about the operation
### Aliases: mutate mutate_all mutate_if mutate_at add_tally add_count

### ** Examples

mutate(mtcars, new_var = 1)
#> mutate: new variable 'new_var' with one unique value and 0% NA
mutate(mtcars, new_var = NA)



