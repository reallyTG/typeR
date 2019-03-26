library(c14bazAAR)


### Name: duplicates
### Title: Mark and remove duplicates in a *c14_date_list*
### Aliases: duplicates mark_duplicates mark_duplicates.default
###   mark_duplicates.c14_date_list remove_duplicates
###   remove_duplicates.default remove_duplicates.c14_date_list

### ** Examples

mark_duplicates(example_c14_date_list)

library(magrittr)
example_c14_date_list %>%
  mark_duplicates() %>%
  remove_duplicates()




