library(tidylog)


### Name: select
### Title: Wrapper around dplyr::select and related functions that prints
###   information about the operation
### Aliases: select select_all select_if select_at

### ** Examples

select(mtcars, mpg, wt)
#> select: dropped 9 variables (cyl, disp, hp, drat, qsec, …)
select(mtcars, dplyr::matches("a"))
#> select: dropped 7 variables (mpg, cyl, disp, hp, wt, …)



