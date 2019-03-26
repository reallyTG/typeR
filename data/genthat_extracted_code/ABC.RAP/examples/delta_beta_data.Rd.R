library(ABC.RAP)


### Name: delta_beta_data
### Title: Applying delta beta analysis to calculate the difference between
###   cases and controls
### Aliases: delta_beta_data

### ** Examples

data(test_data)
data(nonspecific_probes)
test_data_filtered <- filter_data(test_data)
test_data_delta_beta <- delta_beta_data(test_data_filtered, 1, 2, 3, 4, 0.5, -0.5, 0.94, 0.06)




