library(rollmatch)


### Name: chr_2_factor
### Title: Convert character variables in formula to factor variables. As
###   it's an internal helper function to aid in testing, it is not
###   exported for use outside of the package.
### Aliases: chr_2_factor
### Keywords: internal

### ** Examples

## Not run: 
##D df <- data.frame(x = 1:3, y = 3:1, z = c("a", "b", "c"),
##D                  stringsAsFactors = FALSE)
##D vars <- names(df)
##D newdf <- df <- chr_2_factor(df, vars)
##D lapply(df, class)
## End(Not run)




