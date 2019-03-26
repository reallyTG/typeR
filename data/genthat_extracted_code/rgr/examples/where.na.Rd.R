library(rgr)


### Name: where.na
### Title: Identify Vector Elements or Data Frame/Matrix Rows with NAs
### Aliases: where.na
### Keywords: misc

### ** Examples

## Identify rows with NAs
xx <- c(15, 39, 18, 16, NA, 53)
where.na(xx)

## To use where.na to remove NAs, method 1
xx
temp <- where.na(xx)
temp
xxx <- xx[-temp]
xxx

## To use where.na to remove NAs, method 2
xx
xxx <- xx[-where.na(xx)]
xxx

## Clean-up
rm(xx)
rm(xxx)
rm(temp)



