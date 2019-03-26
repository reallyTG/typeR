library(cladoRcpp)


### Name: rcpp_areas_list_to_states_list
### Title: Make a list of 0-based indices of possible combinations of input
###   areas
### Aliases: rcpp_areas_list_to_states_list

### ** Examples

# Specify the areas
areas_list = c("A", "B", "C")
areas_list

# Let's try Rcpp_combn_zerostart, in case that is the source of a
# problem found via AddressSanitizer
Rcpp_combn_zerostart(n_to_choose_from=4, k_to_choose=2, maxlim=1e+07)
Rcpp_combn_zerostart(n_to_choose_from=4, k_to_choose=3, maxlim=1e+07)


## Not run: 
##D 
##D # Calculate the list of 0-based indices for each possible geographic range, i.e.
##D # each combination of areas
##D states_list = rcpp_areas_list_to_states_list(areas=areas_list, maxareas=3, 
##D include_null_range=FALSE)
##D states_list
##D states_list = rcpp_areas_list_to_states_list(areas=areas_list, maxareas=3, 
##D include_null_range=TRUE)
##D states_list
##D states_list = rcpp_areas_list_to_states_list(areas=areas_list, maxareas=2, 
##D include_null_range=TRUE)
##D states_list
##D states_list = rcpp_areas_list_to_states_list(areas=areas_list, maxareas=1, 
##D include_null_range=TRUE)
##D states_list
##D 
## End(Not run)




