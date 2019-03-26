library(platetools)


### Name: plate_matrix
### Title: plate layout matrix from well IDs
### Aliases: plate_matrix

### ** Examples

a <- 1:96
wells <- num_to_well(1:96)
plate_matrix(data = a, well = wells)

x <- rnorm(384)
wells <- num_to_well(1:384, plate = 384)
plate_matrix(data = x, well = wells, plate = 384)



