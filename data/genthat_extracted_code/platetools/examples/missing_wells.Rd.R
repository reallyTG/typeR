library(platetools)


### Name: missing_wells
### Title: Returns wells that are missing from a complete plate
### Aliases: missing_wells

### ** Examples

vals <- rnorm(96) ; wells <- num_to_well(1:96)
df <- data.frame(vals, wells)
df_missing <- df[-c(1:10), ]
missing_wells(df_missing, "wells")



