library(platetools)


### Name: pc_grid
### Title: Plots multiple platemaps as a heatmap of the first principal
###   component.
### Aliases: pc_grid

### ** Examples

df01 <- data.frame(
  well = num_to_well(1:96),
  plate = 1,
  vals1 = rnorm(1:96),
  vals2 = rnorm(1:96))

df02 <- data.frame(
  well = num_to_well(1:96),
  plate = 2,
  vals1 = rnorm(1:96),
  vals2 = rnorm(1:96))

df <- rbind(df01, df02)

pc_grid(data = df[, 3:4],
    well = df$well,
    plate_id = df$plate,
    plate = 96)



