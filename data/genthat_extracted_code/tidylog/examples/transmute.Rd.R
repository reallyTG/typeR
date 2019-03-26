library(tidylog)


### Name: transmute
### Title: Wrapper around dplyr::transmute and related functions that
###   prints information about the operation
### Aliases: transmute transmute_all transmute_if transmute_at

### ** Examples

transmute(mtcars, mpg = mpg * 2)
#> transmute: dropped 10 variables (cyl, disp, hp, drat, wt, …)
#> transmute: changed 32 values (100%) of 'mpg' (0 new NA)



