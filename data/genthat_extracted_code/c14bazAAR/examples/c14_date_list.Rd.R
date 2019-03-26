library(c14bazAAR)


### Name: c14_date_list
### Title: *c14_date_list*
### Aliases: c14_date_list as.c14_date_list is.c14_date_list
###   format.c14_date_list print.c14_date_list

### ** Examples

# c14_date_list can be crafted manually:
as.c14_date_list(data.frame(c14age = c(2000, 2500), c14std = c(30, 35)))

# The c14_date_list class is stripped if
# you apply functions to a c14_date_list
# that return tibbles or data.frames.
# You have to add the class again afterwards:
library(magrittr)
example_c14_date_list %>%
  dplyr::filter(sourcedb == "CALPAL") %>%
  as.c14_date_list()

is.c14_date_list(5) # FALSE
is.c14_date_list(example_c14_date_list) # TRUE

print(example_c14_date_list)




