library(dlookr)


### Name: get_class
### Title: Extracting a class of variables
### Aliases: get_class

### ** Examples

## Not run: 
##D # data.frame
##D get_class(iris)
##D 
##D # tbl_df
##D get_class(ggplot2::diamonds)
##D 
##D library(dplyr)
##D get_class(ggplot2::diamonds) %>%
##D   filter(class %in% c("integer", "numeric"))
## End(Not run)



