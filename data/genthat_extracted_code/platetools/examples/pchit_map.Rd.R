library(platetools)


### Name: pchit_map
### Title: Plots a heatmap identifying hits from the first principal
###   component
### Aliases: pchit_map

### ** Examples

v1 <- rnorm(1:96)
v2 <- rnorm(1:96)
v3 <- rnorm(1:96)
wells <- num_to_well(1:96)
df <- data.frame(wells, v1, v2, v3)


pchit_map(data = df[, 2:4],
          well = df$wells,
          threshold = 1.5)



