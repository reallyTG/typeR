library(plater)


### Name: add_plate
### Title: Read a plater-formatted file and combine it with an existing
###   data frame.
### Aliases: add_plate

### ** Examples

# Part of the data is tidy
file <- system.file("extdata", "example-2-part-A.csv", package = "plater")
data <- read.csv(file)

# Part of the data is plate-shaped
plate_shaped <- system.file("extdata", "example-2-part-B.csv", package = "plater")

# Combine the two
data <- add_plate(
   data = data, 
   file = plate_shaped,
   well_ids_column = "Wells")

# Now data are tidy
head(data)



