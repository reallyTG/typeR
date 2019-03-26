library(cytominer)


### Name: transform
### Title: Transform observation variables.
### Aliases: transform

### ** Examples

population <- tibble::data_frame(
   Metadata_Well = c("A01", "A02", "B01", "B02"),
   Intensity_DNA = c(8, 20, 12, 32)
 )
variables <- c("Intensity_DNA")
transform(population, variables, operation = "generalized_log")




