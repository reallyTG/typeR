library(HHG)


### Name: Fast.independence.test
### Title: Atoms based distribution-free test of independence
### Aliases: Fast.independence.test

### ** Examples


## Not run: 
##D 
##D N_Large = 1000
##D data_Large = hhg.example.datagen(N_Large, 'W')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D NullTable_for_N_Large_MXL_tables = Fast.independence.test.nulltable(N_Large,
##D variant = 'ADP-EQP-ML', nr.atoms = 30,nr.perm=200)
##D 
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXL_tables)
##D 
##D ADP_EQP_ML_Result
##D 
##D #the null distribution depends only on the sample size, so the same
##D #null table can be used for testing different hypotheses with the same sample size.
##D #For example, for another data set with N_Large sample size:
##D data_Large = hhg.example.datagen(N_Large, 'Circle')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D #The MinP combining method p-values may be reported:
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXL_tables,
##D   combining.type='MinP')
##D ADP_EQP_ML_Result
##D 
##D #or both MinP and Fisher combining methods p-values:
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXL_tables,
##D   combining.type='Both')
##D ADP_EQP_ML_Result
##D 
##D 
## End(Not run)





