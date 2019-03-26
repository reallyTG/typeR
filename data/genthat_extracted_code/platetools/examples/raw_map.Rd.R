library(platetools)


### Name: raw_map
### Title: Plots a platemap with heatmap of raw values
### Aliases: raw_map

### ** Examples

df <- data.frame(vals = rnorm(1:384),
  well = num_to_well(1:384, plate = 384))

raw_map(data = df$vals,
        well = df$well,
        plate = 384)



