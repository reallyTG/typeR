library(bnstruct)


### Name: has.imputed.data
### Title: check if a BNDataset contains impited data.
### Aliases: has.imputed.data has.imputed.data,BNDataset
###   has.imputed.data,BNDataset-method

### ** Examples

## Not run: 
##D x <- BNDataset()
##D has.imputed.data(x) # FALSE
##D 
##D x <- read.dataset(x, "file.header", "file.data")
##D has.imputed.data(x) # FALSE, since read.dataset() actually reads raw data.
##D 
##D x <- impute(x)
##D has.imputed.data(x) # TRUE
## End(Not run)




