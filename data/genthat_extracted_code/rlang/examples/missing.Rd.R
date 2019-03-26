library(rlang)


### Name: missing
### Title: Missing values
### Aliases: missing na_lgl na_int na_dbl na_chr na_cpl
### Keywords: datasets

### ** Examples

typeof(NA)
typeof(na_lgl)
typeof(na_int)

# Note that while the base R missing symbols cannot be overwritten,
# that's not the case for rlang's aliases:
na_dbl <- NA
typeof(na_dbl)



