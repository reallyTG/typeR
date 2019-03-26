library(tidylog)


### Name: inner_join
### Title: Wrapper around dplyr::inner_join and related functions that
###   prints information about the operation
### Aliases: inner_join full_join left_join right_join anti_join semi_join

### ** Examples

left_join(dplyr::band_members, dplyr::band_instruments, by = "name")
#> left_join: added 0 rows and added one column (plays)
full_join(dplyr::band_members, dplyr::band_instruments, by = "name")
#> full_join: added one row and added one column (plays)



