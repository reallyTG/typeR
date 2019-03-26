library(tidylog)


### Name: filter
### Title: Wrapper around dplyr::filter and related functions that prints
###   information about the operation
### Aliases: filter filter_all filter_if filter_at distinct distinct_all
###   distinct_if distinct_at top_n

### ** Examples

filter(mtcars, mpg > 20)
#> filter: removed 18 out of 32 rows (56%)
filter(mtcars, mpg > 100)
#> filter: removed all rows (100%)



