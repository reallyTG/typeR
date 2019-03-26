library(ABC.RAP)


### Name: ttest_data
### Title: applying t-test analysis
### Aliases: ttest_data

### ** Examples

data(test_data)
data(nonspecific_probes)
test_data_filtered <- filter_data(test_data)
test_data_ttest <- ttest_data(test_data_filtered, 1, 2, 3, 4, 1e-3)




