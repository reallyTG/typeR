library(bnstruct)


### Name: has.raw.data
### Title: check if a BNDataset contains raw data.
### Aliases: has.raw.data has.raw.data,BNDataset
###   has.raw.data,BNDataset-method

### ** Examples

## Not run: 
##D x <- BNDataset()
##D has.raw.data(x) # FALSE
##D 
##D x <- read.dataset(x, "file.header", "file.data")
##D has.raw.data(x) # TRUE, since read.dataset() actually reads raw data.
## End(Not run)




