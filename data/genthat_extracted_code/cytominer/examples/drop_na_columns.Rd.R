library(cytominer)


### Name: drop_na_columns
### Title: Remove variables with NA values.
### Aliases: drop_na_columns

### ** Examples

 population <- tibble::data_frame(
   Metadata_group = c("control", "control", "control", "control",
                      "experiment", "experiment", "experiment", "experiment"),
   Metadata_batch = c("a", "a", "b", "b", "a", "a", "b", "b"),
   AreaShape_Area = c(10, 12, 15, 16, 8, 8 ,7, 7),
   AreaShape_Length = c(2, 3, NA, NA, 4, 5, 1, 5)
 )
variables <- c('AreaShape_Area','AreaShape_Length')
drop_na_columns(population, variables)




