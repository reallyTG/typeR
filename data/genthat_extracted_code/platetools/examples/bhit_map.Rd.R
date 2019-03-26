library(platetools)


### Name: bhit_map
### Title: Platemap to identify 'hits' following a B-score normalisation
### Aliases: bhit_map

### ** Examples

df <- data.frame(vals = rnorm(384),
   well = num_to_well(1:384, plate = 384))

bhit_map(data = df$vals,
   well = df$well,
   plate = 384,
   threshold = 3)



