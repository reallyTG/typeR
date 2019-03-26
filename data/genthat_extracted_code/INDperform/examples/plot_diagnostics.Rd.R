library(INDperform)


### Name: plot_diagnostics
### Title: Diagnostic plots for a fitted GAM, GAMM or threshold-GAM(M)
### Aliases: plot_diagnostics

### ** Examples

# Using some models of the Baltic Sea demo data:
# Apply function to a list of various model types
model_list <- c(all_results_ex$thresh_models[[5]],
  model_gam_ex$model[39], all_results_ex$model[76])
plots <- plot_diagnostics(model_list)
plots$cooks_dist[[1]]
plots$acf_plot[[2]]
plots$pacf_plot[[3]]
plots$resid_plot[[1]]
plots$qq_plot[[1]]
plots$gcvv_plot[[1]] # for threshold models
plots$all_plots[[1]] # shows all 5-6 plots

# Make sure that thresh_models have not a nested list structure:
model_list <- all_results_ex$thresh_models[5:6] %>% purrr::flatten(.)
plots <- plot_diagnostics(model_list)



