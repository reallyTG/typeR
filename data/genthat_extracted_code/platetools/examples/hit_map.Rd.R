library(platetools)


### Name: hit_map
### Title: Platemap to identify 'hits' in a screen
### Aliases: hit_map

### ** Examples

df <- data.frame(vals = rnorm(1:384),
  well = num_to_well(1:384, plate = 384))

hit_map(data = df$vals,
       well = df$well,
       plate = 384,
       threshold = 3)



