library(plater)


### Name: read_plates
### Title: Read multiple plater-formatted files and combine result into one
###   data frame.
### Aliases: read_plates

### ** Examples

# Combine multiple files into one tidy data frame
file1 <- system.file("extdata", "example-1.csv", package = "plater")
file2 <- system.file("extdata", "more-bacteria.csv", package = "plater")

# Data are stored in plate-shaped form
data <- read_plates(
   files = c(file1, file2),
   plate_names = c("Experiment 1", "Experiment 2"),
   well_ids_column = "Wells")

# Data from both plates are tidy and in the same data frame
head(data)



