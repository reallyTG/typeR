library(ABC.RAP)


### Name: plot_candidate_genes
### Title: Plotting highly different and significant probes annotated by
###   their corresponding gene names
### Aliases: plot_candidate_genes

### ** Examples

## No test: 
data(test_data)
data(nonspecific_probes)
data(annotation_file)
test_data_filtered <- filter_data(test_data)
test_data_ttest <- ttest_data(test_data_filtered, 1, 2, 3, 4, 1e-3)
test_data_delta_beta <- delta_beta_data(test_data_filtered, 1, 2, 3, 4, 0.5, -0.5, 0.94, 0.06)
test_overlapped_data <- overlap_data(test_data_ttest, test_data_delta_beta)
plot_candidate_genes(test_overlapped_data)
## End(No test)



