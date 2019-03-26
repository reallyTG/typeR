library(platetools)


### Name: z_map
### Title: Plots a platemap with heatmap of scaled values
### Aliases: z_map

### ** Examples

df <- data.frame(vals = rnorm(1:384),
  well = num_to_well(1:384, plate = 384))

z_map(data = df$vals,
      well = df$well,
      plate = 384)



