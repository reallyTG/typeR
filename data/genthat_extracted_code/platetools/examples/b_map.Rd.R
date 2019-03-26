library(platetools)


### Name: b_map
### Title: Plots a heatmap of b-score normalised values in a plate layout
### Aliases: b_map

### ** Examples

df <- data.frame(well = num_to_well(1:96),
vals = rnorm(96))

b_map(data = df$vals,
     well = df$well,
     plate = 96)

df_384 <- data.frame(
         well = num_to_well(1:384, plate = 384),
         vals = rnorm(384))

b_map(data = df_384$vals,
     well = df_384$well,
     plate = 384)



