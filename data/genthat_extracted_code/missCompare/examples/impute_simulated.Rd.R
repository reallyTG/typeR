library(missCompare)


### Name: impute_simulated
### Title: Imputation algorithm tester on simulated data
### Aliases: impute_simulated

### ** Examples

## Not run: 
##D #in case there is no assumed missingness pattern per variable
##D wrap <- impute_simulated(rownum = metadata$Rows,
##D         colnum = metadata$Columns,
##D         cormat = metadata$Corr_matrix,
##D         MD_pattern = metadata$MD_Pattern,
##D         NA_fraction = metadata$Fraction_missingness,
##D         min_PDM = 10,
##D         n.iter = 50)
##D 
##D #in case there is a pre-defined assumed pattern
##D wrap <- impute_simulated(rownum = metadata$Rows,
##D         colnum = metadata$Columns,
##D         cormat = metadata$Corr_matrix,
##D         MD_pattern = metadata$MD_Pattern,
##D         NA_fraction = metadata$Fraction_missingness,
##D         min_PDM = 10,
##D         assumed_pattern = c('MAR','MAR','MCAR','MCAR',
##D                           'MNAR','MCAR','MAR','MNAR',
##D                           'MCAR','MNAR','MCAR'),
##D         n.iter = 50)
## End(Not run)




