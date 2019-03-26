library(inspectr)


### Name: col_check
### Title: Check a single column for data fidelity.
### Aliases: col_check

### ** Examples

col_check(colname = "ID_var", data = dataset, fun = numeric_check,
output = TRUE, stage = "1-Reasonableness")

col_check(colname = "FName", data = dataset, fun = character_check,
output = FALSE)




