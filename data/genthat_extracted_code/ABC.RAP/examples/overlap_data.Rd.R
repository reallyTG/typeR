library(ABC.RAP)


### Name: overlap_data
### Title: Overlapping Student's t-test and delta beta results
### Aliases: overlap_data

### ** Examples

## No test: 
data(test_data)
data(nonspecific_probes)
data(annotation_file)
test_data_filtered <- filter_data(test_data)
test_data_ttest <- ttest_data(test_data_filtered, 1, 2, 3, 4, 1e-3)
test_data_delta_beta <- delta_beta_data(test_data_filtered, 1, 2, 3, 4, 0.5, -0.5, 0.94, 0.06)
test_overlapped_data <- overlap_data(test_data_ttest, test_data_delta_beta)
## End(No test)



