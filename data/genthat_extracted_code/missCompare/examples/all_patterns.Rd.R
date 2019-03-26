library(missCompare)


### Name: all_patterns
### Title: Missing data spike-in in various missing data patterns
### Aliases: all_patterns

### ** Examples

cleaned <- clean(clindata_miss, missingness_coding = -9)
metadata <- get_data(cleaned)
simulated <- simulate(rownum = metadata$Rows, colnum = metadata$Columns,
cormat = metadata$Corr_matrix)

miss_list <- all_patterns(simulated$Simulated_matrix,
                    MD_pattern = metadata$MD_Pattern,
                    NA_fraction = metadata$Fraction_missingness,
                    min_PDM = 20)

miss_list <- all_patterns(simulated$Simulated_matrix,
                    MD_pattern = metadata$MD_Pattern,
                    NA_fraction = metadata$Fraction_missingness,
                    min_PDM = 10,
                    assumed_pattern = c('MAR', 'MCAR', 'MCAR', 'MAR',
                                        'MNAR', 'MCAR', 'MAR', 'MCAR',
                                        'MCAR', 'MAR', 'MNAR'))




