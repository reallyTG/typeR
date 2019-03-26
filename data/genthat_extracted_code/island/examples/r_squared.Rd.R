library(island)


### Name: r_squared
### Title: Model prediction error
### Aliases: r_squared null_model simulated_model

### ** Examples

idaho.sim <- data_generation(as.data.frame(c(rep(0, 163),
rep(1, 57))), 1, matrix(c(0.162599, 0.111252), ncol = 2), 250, 20)
idaho.me <- c(57, apply(idaho.sim, 1, quantile, 0.5))
r_squared(colSums(idaho[[1]][,3:23]), idaho.me, 220)

null_model(colSums(idaho[[1]][,3:23]), 220)

simulated_model(colSums(idaho[[1]][,3:23]), idaho.me)




