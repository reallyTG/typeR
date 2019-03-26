library(cladoRcpp)


### Name: rcpp_states_list_to_DEmat
### Title: C++ conversion of a states list to a dispersal-extinction matrix
###   (DEmat)
### Aliases: rcpp_states_list_to_DEmat

### ** Examples

# Specify the areas
areas_list_txt = c("A", "B", "C")
areas_list_txt

# rcpp_states_list_to_DEmat function requires a 0-based list of areas
areas_list = seq(0, length(areas_list_txt)-1, 1)
areas_list

## Not run: 
##D 
##D # Calculate the list of 0-based indices for each possible 
##D #geographic range, i.e. each combination of areas
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
##D # Hard-code the along-branch dispersal and extinction rates
##D d = 0.2
##D e = 0.1
##D 
##D # Calculate the dispersal weights matrix and the extinction weights matrix
##D # Equal dispersal in all directions (unconstrained)
##D areas = areas_list
##D distances_mat = matrix(1, nrow=length(areas), ncol=length(areas))
##D dmat = matrix(d, nrow=length(areas), ncol=length(areas))
##D dmat
##D 
##D # Equal extinction probability for all areas
##D elist = rep(e, length(areas))
##D elist
##D 
##D # Set up the instantaneous rate matrix (Q matrix, Qmat)
##D # DON'T force a sparse-style (COO-formatted) matrix here
##D force_sparse = FALSE
##D Qmat = rcpp_states_list_to_DEmat(areas_list, states_list, dmat, elist, 
##D include_null_range=TRUE, normalize_TF=TRUE, makeCOO_TF=force_sparse)
##D Qmat
##D 
##D # DO force a sparse-style (COO-formatted) matrix here
##D force_sparse = TRUE
##D Qmat = rcpp_states_list_to_DEmat(areas_list, states_list, dmat, elist, 
##D include_null_range=TRUE, normalize_TF=TRUE, makeCOO_TF=force_sparse)
##D Qmat
##D 
##D 
##D # Repeat with an amat
##D amat = dmat
##D amat[is.numeric(amat)] = 0.33
##D 
##D # Set up the instantaneous rate matrix (Q matrix, Qmat)
##D # DON'T force a sparse-style (COO-formatted) matrix here
##D force_sparse = FALSE
##D Qmat = rcpp_states_list_to_DEmat(areas_list, states_list, dmat, elist, amat, 
##D include_null_range=TRUE, normalize_TF=TRUE, makeCOO_TF=force_sparse)
##D Qmat
##D 
##D # DO force a sparse-style (COO-formatted) matrix here
##D force_sparse = TRUE
##D Qmat = rcpp_states_list_to_DEmat(areas_list, states_list, dmat, elist, amat, 
##D include_null_range=TRUE, normalize_TF=TRUE, makeCOO_TF=force_sparse)
##D Qmat
## End(Not run)





