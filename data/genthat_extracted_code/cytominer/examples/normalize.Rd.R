library(cytominer)


### Name: normalize
### Title: Normalize observation variables.
### Aliases: normalize

### ** Examples

suppressMessages(suppressWarnings(library(magrittr)))
population <- tibble::data_frame(
   Metadata_group = c("control", "control", "control", "control",
                      "experiment", "experiment", "experiment", "experiment"),
   Metadata_batch = c("a", "a", "b", "b", "a", "a", "b", "b"),
   AreaShape_Area = c(10, 12, 15, 16, 8, 8, 7, 7)
 )
variables <- c('AreaShape_Area')
strata <- c('Metadata_batch')
sample <- population %>% dplyr::filter(Metadata_group == 'control')
cytominer::normalize(population, variables, strata, sample, operation = "standardize")




