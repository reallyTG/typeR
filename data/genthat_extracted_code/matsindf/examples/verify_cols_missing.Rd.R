library(matsindf)


### Name: verify_cols_missing
### Title: Verify that column names in a data frame are not already present
### Aliases: verify_cols_missing

### ** Examples

df <- data.frame(a = c(1,2), b = c(3,4))
verify_cols_missing(df, "d") # Silent. There will be no problem adding column "d".
newcols <- c("c", "d", "a", "b")
## Not run: verify_cols_missing(df, newcols)



