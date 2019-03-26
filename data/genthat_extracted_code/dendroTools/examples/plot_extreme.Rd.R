library(dendroTools)


### Name: plot_extreme
### Title: plot_extreme
### Aliases: plot_extreme
### Keywords: internal

### ** Examples

## Not run: 
##D data(LJ_daily_temperatures)
##D data(example_proxies_1)
##D Example1 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "lm", metric = "r.squared",
##D fixed_width = 90, previous_year = TRUE, row_names_subset = TRUE)
##D plot_extreme(Example1)
##D 
##D Example2 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "brnn",
##D metric = "adj.r.squared", lower_limit = 50, upper_limit = 55, neurons = 1,
##D row_names_subset = TRUE, previous_year = TRUE)
##D plot_extreme(Example2)
##D 
##D # Example with negative correlations
##D data(data_TRW_1)
##D LJ_daily_temperatures_subset = LJ_daily_temperatures[-c(53:55), ]
##D Example3 <- daily_response(response = data_TRW_1,
##D env_data = LJ_daily_temperatures_subset, method = "lm", metric = "adj.r.squared",
##D lower_limit = 35, upper_limit = 40, previous_year = TRUE, row_names_subset = TRUE)
##D plot_extreme(Example3)
##D 
##D Example4 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "lm",
##D metric = "r.squared", lower_limit = 30, upper_limit = 120, neurons = 1,
##D row_names_subset = TRUE, previous_year = TRUE)
##D plot_extreme(Example4)
## End(Not run)




