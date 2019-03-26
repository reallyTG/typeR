library(missCompare)


### Name: test_random_imp
### Title: Testing the random replacement imputation algorithm
### Aliases: test_random_imp

### ** Examples

clindata_miss_mini <- clindata_miss[1:80,1:4]
cleaned <- clean(clindata_miss_mini, missingness_coding = -9)
metadata <- get_data(cleaned)
simulated <- simulate(rownum = metadata$Rows, colnum = metadata$Columns,
cormat = metadata$Corr_matrix)
miss_list <- all_patterns(simulated$Simulated_matrix,
                    MD_pattern = metadata$MD_Pattern,
                    NA_fraction = metadata$Fraction_missingness,
                    min_PDM = 2)

test_random_imp(X_hat = simulated$Simulated_matrix, list = miss_list)




