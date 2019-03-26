library(dlookr)


### Name: find_class
### Title: Extract variable names or indices of a specific class
### Aliases: find_class

### ** Examples

## Not run: 
##D # data.frame
##D find_class(iris, "numerical")
##D find_class(iris, "numerical", index = FALSE)
##D find_class(iris, "categorical")
##D find_class(iris, "categorical", index = FALSE)
##D 
##D # tbl_df
##D find_class(ISLR::Carseats, "numerical")
##D find_class(ISLR::Carseats, "numerical", index = FALSE)
##D find_class(ISLR::Carseats, "categorical")
##D find_class(ISLR::Carseats, "categorical", index = FALSE)
##D 
##D # type is "categorical2"
##D iris2 <- data.frame(iris, char = "chars",
##D                     stringsAsFactors = FALSE)
##D find_class(iris2, "categorical", index = FALSE)
##D find_class(iris2, "categorical2", index = FALSE)
## End(Not run)



