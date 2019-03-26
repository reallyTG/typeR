library(bor)


### Name: countb
### Title: countb
### Aliases: countb

### ** Examples

## create list of asymmetric matrices (data2) from data object
## data object is obtained by converting raw focal observations' data in ex_field_data with
## dtable function
 b <- c("+","-")
 data <- dtable(ex_field_data, bset = b)
 data2 <- countb(data)
 data2



