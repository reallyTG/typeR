library(pammtools)


### Name: get_intervals
### Title: Information on intervals in which times fall
### Aliases: get_intervals get_intervals.default

### ** Examples

set.seed(111018)
brks <- c(0, 4.5, 5, 10, 30)
int_info(brks)
x <- runif (3, 0, 30)
x
get_intervals(brks, x)




