library(c14bazAAR)


### Name: determine_country_by_coordinate
### Title: Functions to improve the country attribution in a
###   *c14_date_list*
### Aliases: determine_country_by_coordinate
###   determine_country_by_coordinate.default
###   determine_country_by_coordinate.c14_date_list country_attribution
###   finalize_country_name finalize_country_name.default
###   finalize_country_name.c14_date_list standardize_country_name
###   standardize_country_name.default
###   standardize_country_name.c14_date_list

### ** Examples

library(magrittr)
example_c14_date_list %>%
  determine_country_by_coordinate() %>%
  standardize_country_name() %>%
  finalize_country_name()




