library(platetools)


### Name: fill_plate
### Title: Fill in missing wells
### Aliases: fill_plate

### ** Examples

vals <- rnorm(96) ; wells <- num_to_well(1:96)
df <- data.frame(wells, vals)
df_missing <- df[-c(1:10), ]
fill_plate(df_missing, "wells")



