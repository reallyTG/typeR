library(inspectr)


### Name: three_col_check
### Title: Check a column for data fidelity using criteria related to two
###   additional columns.
### Aliases: three_col_check

### ** Examples

three_col_check(colname1 = "Perf_Lvl", colname2 = "Var1", colname3 = "Var2",
data = dataset, fun = function(col1, col2, col3){
   col1 %in% c("Basic", "Intermediate", "Advanced") |
   (is.na(col1) & (col3 %% 2 ==0) & (col2 %% 2 ==1 ))
   })



