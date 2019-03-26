library(dendroTools)


### Name: plot_heatmap
### Title: plot_heatmap
### Aliases: plot_heatmap
### Keywords: internal

### ** Examples

## Not run: 
##D data(LJ_daily_temperatures)
##D data(example_proxies_1)
##D Example1 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "lm", metric = "r.squared",
##D fixed_width = 90, previous_year = TRUE, row_names_subset = TRUE)
##D plot_heatmap(Example1)
##D 
##D Example2 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "brnn",
##D metric = "adj.r.squared", lower_limit = 50, upper_limit = 55,
##D row_names_subset = TRUE)
##D plot_heatmap(Example2)
##D 
##D library(dplyr)
##D oxygen_isotope <- dplyr::select(example_proxies_1, O18)
##D Example3 <- daily_response(response = oxygen_isotope,
##D env_data = LJ_daily_temperatures, method = "cor", lower_limit = 50,
##D upper_limit = 55, previous_year = TRUE, row_names_subset = TRUE)
##D plot_heatmap(Example3)
## End(Not run)




