library(missCompare)


### Name: test_pcaMethods_NLPCA
### Title: Testing the pcaMethods NLPCA missing data imputation algorithm
### Aliases: test_pcaMethods_NLPCA

### ** Examples

## Not run: 
##D clindata_miss_mini <- clindata_miss[1:80,1:4]
##D cleaned <- clean(clindata_miss_mini, missingness_coding = -9)
##D metadata <- get_data(cleaned)
##D simulated <- simulate(rownum = metadata$Rows, colnum = metadata$Columns,
##D cormat = metadata$Corr_matrix)
##D miss_list <- all_patterns(simulated$Simulated_matrix,
##D                     MD_pattern = metadata$MD_Pattern,
##D                     NA_fraction = metadata$Fraction_missingness,
##D                     min_PDM = 2)
##D 
##D test_pcaMethods_NLPCA(X_hat = simulated$Simulated_matrix, list = miss_list)
## End(Not run)




