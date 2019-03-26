library(cytominer)


### Name: generalized_log
### Title: Generalized log transform data.
### Aliases: generalized_log

### ** Examples

population <- tibble::data_frame(
   Metadata_Well = c("A01", "A02", "B01", "B02"),
   Intensity_DNA = c(8, 20, 12, 32)
 )
variables <- c("Intensity_DNA")
generalized_log(population, variables)




