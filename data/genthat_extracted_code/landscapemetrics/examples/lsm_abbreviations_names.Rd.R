library(landscapemetrics)


### Name: lsm_abbreviations_names
### Title: Tibble of abbreviations coming from FRAGSTATS
### Aliases: lsm_abbreviations_names
### Keywords: datasets

### ** Examples

aggregation_index <- lsm_p_area(landscape)
aggregation_index <- dplyr::right_join(aggregation_index,
                                       lsm_abbreviations_names,
                                       by = 'metric')
aggregation_index





