library(platetools)


### Name: pc_map
### Title: Principal component heatmap in a plate layout
### Aliases: pc_map

### ** Examples

df <- data.frame(
  well = num_to_well(1:96),
  vals1 = rnorm(1:96),
  vals2 = rnorm(1:96))

pc_map(data = df[, 2:3],
       well = df$well,
       plate = 96)



