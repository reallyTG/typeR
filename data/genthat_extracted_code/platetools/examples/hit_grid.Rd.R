library(platetools)


### Name: hit_grid
### Title: Plots multiple platemaps with and identifies hits
### Aliases: hit_grid

### ** Examples

df01 <- data.frame(well = num_to_well(1:96),
  vals = rnorm(96),
  plate = 1)

df02 <- data.frame(well = num_to_well(1:96),
  vals = rnorm(96),
  plate = 2)

df <- rbind(df01, df02)

hit_grid(data = df$vals,
    well = df$well,
    plate_id = df$plate,
    plate = 96,
    each = FALSE)



