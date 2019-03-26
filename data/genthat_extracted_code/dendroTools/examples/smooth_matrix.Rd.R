library(dendroTools)


### Name: smooth_matrix
### Title: smooth_matrix
### Aliases: smooth_matrix
### Keywords: internal

### ** Examples

library(dendroTools)
data(LJ_daily_temperatures)
data(example_proxies_1)
Example1 <- daily_response(response = example_proxies_1,
env_data = LJ_daily_temperatures, method = "brnn",
metric = "r.squared", lower = 250, upper = 251,
previous_year = FALSE, brnn_smooth = TRUE, alpha = 0.1,
row_names_subset = TRUE)
smoothed <- smooth_matrix(mat = Example1[[1]])

mat_1 <-  matrix(seq(1.01, 2, by = 0.01)  , ncol = 10, byrow = TRUE)
mat_1[5 ,5] <- -1
mat_2 <- smooth_matrix(mat_1)




