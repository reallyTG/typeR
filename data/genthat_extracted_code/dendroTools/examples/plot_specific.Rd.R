library(dendroTools)


### Name: plot_specific
### Title: plot_specific
### Aliases: plot_specific
### Keywords: internal

### ** Examples

## Not run: 
##D data(LJ_daily_temperatures)
##D data(KRE_daily_temperatures)
##D data(example_proxies_1)
##D Example1 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "lm", metric = "r.squared",
##D lower_limit = 90, upper_limit = 150, row_names_subset = TRUE,
##D previous_year = TRUE)
##D plot_specific(Example1, window_width = 90)
##D 
##D Example2 <- daily_response(response = data_TRW_1,
##D env_data = KRE_daily_temperatures, method = "cor",
##D metric = "adj.r.squared", lower_limit = 150, upper_limit = 155,
##D neurons = 1, row_names_subset = TRUE, previous_year = TRUE)
##D plot_specific(Example2, window_width = 153, title = TRUE)
##D 
##D Example3 <- daily_response(response = example_proxies_1,
##D env_data = LJ_daily_temperatures, method = "brnn",
##D metric = "adj.r.squared", lower_limit = 150, upper_limit = 155,
##D neurons = 1, previous_year = TRUE, row_names_subset = TRUE)
##D plot_specific(Example3, window_width = 153, title = TRUE)
## End(Not run)




