library(valaddin)


### Name: validate
### Title: Validate objects
### Aliases: validate validate %checkout%

### ** Examples

## Not run: 
##D library(magrittr)
##D 
##D # Valid assertions: data frame returned (invisibly)
##D mtcars %>%
##D   validate(
##D     vld_all(~sapply(., is.numeric)),
##D     ~{nrow(.) > 10},
##D     vld_all(~c("mpg", "cyl") %in% names(.))
##D   )
##D 
##D # Invalid assertions: error raised
##D mtcars %>%
##D   validate(
##D     vld_all(~sapply(., is.numeric)),
##D     ~{nrow(.) > 1000},
##D     vld_all(~c("mpg", "cylinders") %in% names(.))
##D   )
## End(Not run)



