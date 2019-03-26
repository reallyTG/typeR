library(umx)


### Name: umx_default_option
### Title: Select first item in list of options, while being flexible about
###   choices.
### Aliases: umx_default_option umx_match.arg

### ** Examples

option_list = c("default", "par.observed", "empirical")
umx_default_option("par.observed", option_list)

# An example of checking a bad item and stopping
## Not run: 
##D umx_default_option("bad", option_list)
## End(Not run)
umx_default_option("allow me", option_list, check = FALSE)
umx_default_option(option_list, option_list)
option_list = c(NULL, "par.observed", "empirical")
 # fails with NULL!!!!!
umx_default_option(option_list, option_list)
option_list = c(NA, "par.observed", "empirical")
umx_default_option(option_list, option_list) # use NA instead
option_list = c(TRUE, FALSE, NA)
umx_default_option(option_list, option_list) # works with non character



