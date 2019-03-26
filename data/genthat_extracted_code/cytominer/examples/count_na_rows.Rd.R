library(cytominer)


### Name: count_na_rows
### Title: Count the number of 'NA's per variable.
### Aliases: count_na_rows

### ** Examples


population <- tibble::data_frame(
   Metadata_group = c("control", "control", "control", "control",
                      "experiment", "experiment", "experiment", "experiment"),
   Metadata_batch = c("a", "a", "b", "b", "a", "a", "b", "b"),
   AreaShape_Area = c(10, 12, 15, 16, 8, 8,7, 7),
   AreaShape_length = c(2, 3, NA, NA, 4, 5, 1, 5)
)
variables <- c('AreaShape_Area','AreaShape_length')
count_na_rows(population, variables)




