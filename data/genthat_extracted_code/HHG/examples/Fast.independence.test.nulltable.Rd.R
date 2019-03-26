library(HHG)


### Name: Fast.independence.test.nulltable
### Title: Null tables for the atoms based distribution-free test of
###   independence.
### Aliases: Fast.independence.test.nulltable

### ** Examples

## Not run: 
##D 
##D 
##D N_Large = 1000
##D data_Large = hhg.example.datagen(N_Large, 'W')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D NullTable_for_N_Large_MXM_tables = Fast.independence.test.nulltable(N_Large,
##D variant = 'ADP-EQP',  nr.atoms = 30,nr.perm=200)
##D NullTable_for_N_Large_MXL_tables = Fast.independence.test.nulltable(N_Large,
##D variant = 'ADP-EQP-ML', nr.atoms = 30,nr.perm=200)
##D 
##D ADP_EQP_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXM_tables)
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXL_tables)
##D 
##D ADP_EQP_Result
##D ADP_EQP_ML_Result
##D 
##D #null distribution depends only on data size (length(X)),
##D #so same null table can be used many times.
##D #For example, another data set:
##D data_Large = hhg.example.datagen(N_Large, 'Circle')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D #you may use Fisher type scores:
##D ADP_EQP_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXM_tables, combining.type='Fisher')
##D #or both MinP and Fisher:
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large,
##D NullTable_for_N_Large_MXL_tables, combining.type='Both')
##D 
##D 
##D ADP_EQP_Result
##D ADP_EQP_ML_Result
##D 
## End(Not run)




