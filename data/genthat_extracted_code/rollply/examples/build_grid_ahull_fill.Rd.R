library(rollply)


### Name: build_grid_ahull_fill
### Title: Regular grid in alpha-hull
### Aliases: build_grid_ahull_fill

### ** Examples


data(meadow)

# Plot a grid with diagnostics
grid <- build_grid_ahull_fill(meadow[ ,c('lon','lat')], 10000,
                              grid_opts = list(verbose = TRUE))
plot(grid, pch = 21)

# See the influence of alpha parameter
par(mfrow = c(1, 4))
for ( alpha in c( .3, 1, 4, 10) ) {
  grid <- build_grid_ahull_fill(meadow[ ,c('lon','lat')], 10000,
                                grid_opts = list(alpha = alpha))
  plot(grid, pch = 21)
  title(paste0("alpha=",alpha))
}




