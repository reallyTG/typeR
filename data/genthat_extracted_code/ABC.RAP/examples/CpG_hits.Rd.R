library(ABC.RAP)


### Name: CpG_hits
### Title: Identifying genes for which multiple CpG sites show significant
###   methylation difference
### Aliases: CpG_hits

### ** Examples

## No test: 
data(test_data)
data(nonspecific_probes)
data(annotation_file)
test_data_filtered <- filter_data(test_data)
test_data_ttest <- ttest_data(test_data_filtered, 1, 2, 3, 4, 1e-3)
test_data_delta_beta <- delta_beta_data(test_data_filtered, 1, 2, 3, 4, 0.5, -0.5, 0.94, 0.06)
test_overlapped_data <- overlap_data(test_data_ttest, test_data_delta_beta)
test_CpG_hits <- CpG_hits(test_overlapped_data)
## End(No test)



