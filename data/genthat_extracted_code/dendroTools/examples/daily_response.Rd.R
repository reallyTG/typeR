library(dendroTools)


### Name: daily_response
### Title: daily_response
### Aliases: daily_response

### ** Examples

## Not run: 
##D # Load the dendroTools R package
##D library(dendroTools)
##D 
##D # Load data
##D data(data_MVA)
##D data(data_TRW)
##D data(data_TRW_1)
##D data(example_proxies_individual)
##D data(example_proxies_1)
##D data(LJ_daily_temperatures)
##D 
##D # 1 Example with fixed width
##D example_fixed_width <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
##D                                      method = "cor", fixed_width = 0,
##D                                      row_names_subset = TRUE, remove_insignificant = TRUE,
##D                                      alpha = 0.05, aggregate_function = 'mean',
##D                                      reference_window = "end")
##D example_fixed_width$plot_extreme
##D 
##D # 2 Example for past and present
##D example_MVA_past <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
##D method = "cor", lower_limit = 21, upper_limit = 180,
##D row_names_subset = TRUE, previous_year = TRUE,
##D remove_insignificant = TRUE, alpha = 0.05,
##D plot_specific_window = 60, subset_years = c(1940, 1980), aggregate_function = 'sum')
##D 
##D example_MVA_present <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
##D                                       method = "cor", lower_limit = 21, upper_limit = 60,
##D                                       row_names_subset = TRUE, previous_year = TRUE,
##D                                       remove_insignificant = TRUE, alpha = 0.05,
##D                                       plot_specific_window = 60, subset_years = c(1981, 2010),
##D                                       aggregate_function = 'sum')
##D 
##D example_MVA_past$plot_heatmap
##D example_MVA_present$plot_heatmap
##D example_MVA_past$plot_specific
##D example_MVA_present$plot_specific
##D 
##D # 3 Example PCA
##D example_PCA <- daily_response(response = example_proxies_individual,
##D                               env_data = LJ_daily_temperatures, method = "lm",
##D                               lower_limit = 21, upper_limit = 180,
##D                               row_names_subset = TRUE, remove_insignificant = TRUE,
##D                               alpha = 0.01, PCA_transformation = TRUE,
##D                               components_selection = "manual", N_components = 2)
##D 
##D summary(example_PCA$PCA_output)
##D example_PCA$plot_heatmap
##D 
##D # 4 Example negative correlations
##D example_neg_cor <- daily_response(response = data_TRW_1, env_data = LJ_daily_temperatures,
##D                                   method = "cor", lower_limit = 21, upper_limit = 180,
##D                                   row_names_subset = TRUE, remove_insignificant = TRUE,
##D                                   alpha = 0.05)
##D 
##D example_neg_cor$plot_heatmap
##D example_neg_cor$plot_extreme
##D example_neg_cor$temporal_stability
##D 
##D # 5 Example of multiproxy analysis
##D summary(example_proxies_1)
##D cor(example_proxies_1)
##D 
##D example_multiproxy <- daily_response(response = example_proxies_1,
##D                                      env_data = LJ_daily_temperatures,
##D                                      method = "lm", metric = "adj.r.squared",
##D                                      lower_limit = 21, upper_limit = 180,
##D                                      row_names_subset = TRUE, previous_year = FALSE,
##D                                      remove_insignificant = TRUE, alpha = 0.05)
##D 
##D example_multiproxy$plot_heatmap
##D 
##D # 6 Example to test the temporal stability
##D example_MVA_ts <- daily_response(response = data_MVA, env_data = LJ_daily_temperatures,
##D method = "brnn", lower_limit = 100, metric = "adj.r.squared", upper_limit = 180,
##D row_names_subset = TRUE, remove_insignificant = TRUE, alpha = 0.05,
##D temporal_stability_check = "running_window", k_running_window = 10)
##D 
##D example_MVA_ts$temporal_stability
##D 
## End(Not run)



