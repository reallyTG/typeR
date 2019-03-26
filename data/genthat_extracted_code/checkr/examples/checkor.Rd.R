library(checkr)


### Name: checkor
### Title: Check OR
### Aliases: checkor

### ** Examples

checkor(check_null(NULL), check_null(1), error = FALSE)
checkor(check_null(1), check_null(1), error = FALSE)
checkor(check_null(1), check_null(2), error = FALSE)



