library(cleanr)


### Name: function_checks
### Title: Function Checks
### Aliases: check_line_width check_nesting_depth check_num_arguments
###   check_num_lines check_num_lines_of_code check_return function_checks

### ** Examples

print(check_num_arguments(check_num_arguments))
print(check_nesting_depth(check_nesting_depth))
print(check_num_lines(check_num_lines))
print(check_num_lines_of_code(check_num_lines_of_code))
print(check_return(check_return))
# R reformats functions on import (see
# help(get_function_body, package = "cleanr")), so we need 90 characters:
print(check_line_width(check_line_width, max_line_width = 90))



