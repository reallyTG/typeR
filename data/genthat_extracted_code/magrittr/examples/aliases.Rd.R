library(magrittr)


### Name: extract
### Title: Aliases
### Aliases: add and divide_by divide_by_int equals extract extract2 inset
###   inset2 is_greater_than is_in is_less_than is_weakly_greater_than
###   is_weakly_less_than mod multiply_by multiply_by_matrix 'n'est pas'
###   not or raise_to_power set_colnames set_names set_rownames subtract
###   use_series

### ** Examples

iris %>%
   extract(, 1:4) %>%
   head

good.times <-
  Sys.Date() %>%
  as.POSIXct %>%
  seq(by = "15 mins", length.out = 100) %>%
  data.frame(timestamp = .)

good.times$quarter <-
  good.times %>%
  use_series(timestamp) %>%
  format("%M") %>%
  as.numeric %>%
  divide_by_int(15) %>%
  add(1)



