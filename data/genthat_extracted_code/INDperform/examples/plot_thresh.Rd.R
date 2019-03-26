library(INDperform)


### Name: plot_thresh
### Title: Helper functions for plot_model
### Aliases: plot_thresh plot_response plot_predict plot_deriv plot_all_mod
### Keywords: internal

### ** Examples

# Example for dealing with nested list-columns using the
# Baltic Sea demo data
thresh_sublist1 <- all_results_ex$thresh_models[[69]]
thresh_sublist2 <- all_results_ex$thresh_models[[70]]
thresh_sublist <- list(thresh_sublist1, thresh_sublist2) %>%
  purrr::flatten(.)
plot_thresh(thresh_sublist, choose_thresh_gam = NULL)
plot_thresh(thresh_sublist, choose_thresh_gam = 1)
plot_thresh(thresh_sublist, choose_thresh_gam = 2)



