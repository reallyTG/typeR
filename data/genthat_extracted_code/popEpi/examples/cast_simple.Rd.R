library(popEpi)


### Name: cast_simple
### Title: Cast 'data.table'/'data.frame' from long format to wide format
### Aliases: cast_simple

### ** Examples

## Not run: 
##D ## e.g. silly counts from a long-format table to a wide format
##D test <- copy(sire)
##D test$dg_y <- year(test$dg_date)
##D test$ex_y <- year(test$ex_date)
##D tab <- ltable(test, c("dg_y","ex_y"))
##D cast_simple(tab, columns='dg_y', rows="ex_y", values="obs")
## End(Not run)



