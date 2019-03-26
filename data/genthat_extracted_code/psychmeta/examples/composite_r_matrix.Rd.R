library(psychmeta)


### Name: composite_r_matrix
### Title: Matrix formula to estimate the correlation between two weighted
###   or unweighted composite variables
### Aliases: composite_r_matrix

### ** Examples

composite_r_scalar(mean_rxy = .3, k_vars_x = 4, mean_intercor_x = .4)
R <- reshape_vec2mat(.4, order = 5)
R[-1,1] <- R[1,-1] <- .3
composite_r_matrix(r_mat = R, x_col = 2:5, y_col = 1)



