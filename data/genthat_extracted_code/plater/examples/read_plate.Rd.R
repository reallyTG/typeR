library(plater)


### Name: read_plate
### Title: Read a plater-formatted file and turn it into a tidy data frame.
### Aliases: read_plate

### ** Examples

file_path <- system.file("extdata", "example-1.csv", package = "plater")

# Data are stored in plate-shaped form
data <- read_plate(
   file = file_path,
   well_ids_column = "Wells")

# Now data are tidy
head(data)



