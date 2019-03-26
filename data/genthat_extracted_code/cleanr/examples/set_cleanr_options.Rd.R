library(cleanr)


### Name: set_cleanr_options
### Title: Set Options for 'cleanr'
### Aliases: set_cleanr_options

### ** Examples

# R.C. Martin's Clean Code recommends monadic argument lists.
set_cleanr_options(max_num_arguments = 1)
# R.C. Martin's Clean Code recommends functions less than 20 lines long.
set_cleanr_options(max_lines = 30, max_lines_of_code = 20)
# same as above:
set_cleanr_options(list(max_lines = 30, max_lines_of_code = 20))
get_cleanr_options(flatten_list = TRUE)
# we delete all options and set some anew
options("cleanr" = NULL)
options("cleanr" = list(max_lines = 30, max_lines_of_code = 20))
# fill the missing options with the package's defaults:
set_cleanr_options(overwrite = FALSE)
get_cleanr_options(flatten_list = TRUE)
# reset to the package's defaults:
set_cleanr_options(reset = TRUE)
get_cleanr_options(flatten_list = TRUE)



