library(safetyGraphics)


### Name: compare_cols
### Title: Compares contents of 2 vectors
### Aliases: compare_cols

### ** Examples

#match == FALSE
safetyGraphics:::compare_cols(data_cols=c("a","b","c"),
                              standard_cols=c("d","e","f")) 

# match == TRUE
safetyGraphics:::compare_cols(names(adlbc),
                              safetyGraphics:::getRequiredColumns(standard="ADaM")) 




