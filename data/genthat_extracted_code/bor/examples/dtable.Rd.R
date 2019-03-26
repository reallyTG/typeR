library(bor)


### Name: dtable
### Title: dtable
### Aliases: dtable

### ** Examples

## convert raw focal observations' data in ex_field_data
## see ?ex_field_data for further details
## bsep, asep, missing and noc arguments take default values (".", ";", "x", "0" respectively)
b <- c("+","-")
data <- dtable(ex_field_data, bset = b)
head(data)



