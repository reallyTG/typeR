library(vegtable)


### Name: write_juice
### Title: Exporting Tables for 'Juice'.
### Aliases: write_juice write_juice,vegtable,character,formula-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Kenya_veg)

## Only first 20 observations
Kenya_veg <- Kenya_veg[1:20,]
## Not run: 
##D write_juice(Kenya_veg, "SWEA", FUN=mean)
## End(Not run)



