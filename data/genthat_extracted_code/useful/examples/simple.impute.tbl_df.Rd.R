library(useful)


### Name: simple.impute.tbl_df
### Title: simple.impute.tbl_df
### Aliases: simple.impute.tbl_df

### ** Examples

theDF <- data.frame(A=1:10, B=1:10, C=1:10)
theDF[c(1, 4, 6), c(1)] <- NA
theDF[c(3, 4, 8), c(3)] <- NA

simple.impute.data.frame(theDF)
simple.impute.data.frame(theDF, mean)
simple.impute.data.frame(theDF, constant(4))




