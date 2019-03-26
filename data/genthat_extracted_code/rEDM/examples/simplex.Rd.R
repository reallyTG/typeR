library(rEDM)


### Name: simplex
### Title: Perform univariate forecasting
### Aliases: simplex s_map s_map

### ** Examples

data("two_species_model")
ts <- two_species_model$x[1:200]
simplex(ts, lib = c(1, 100), pred = c(101, 200))

data("two_species_model")
ts <- two_species_model$x[1:200]
simplex(ts, stats_only = FALSE)
 
data("two_species_model")
ts <- two_species_model$x[1:200]
s_map(ts, E = 2)

data("two_species_model")
ts <- two_species_model$x[1:200]
s_map(ts, E = 2, theta = 1, save_smap_coefficients = TRUE)




