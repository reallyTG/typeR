library(platetools)


### Name: b_grid
### Title: Plots multiple b-scored normalised platemaps
### Aliases: b_grid

### ** Examples

df01 <- data.frame(well = num_to_well(1:96),
  vals = rnorm(96),
  plate = 1)

df02 <- data.frame(well = num_to_well(1:96),
  vals = rnorm(96),
  plate = 2)

df <- rbind(df01, df02)

b_grid(data = df$vals,
    well = df$well,
    plate_id = df$plate,
    plate = 96)



