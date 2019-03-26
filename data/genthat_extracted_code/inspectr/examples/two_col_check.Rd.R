library(inspectr)


### Name: two_col_check
### Title: Check a column for data fidelity using criteria related to a
###   second column.
### Aliases: two_col_check

### ** Examples

two_col_check("Var1", "Var2", dataset, less_than_equalto, output = FALSE)

two_col_check("Var2", "Var1", dataset, greater_than, output = TRUE,
   stage = "1-Reasonableness")




