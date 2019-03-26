library(testit)


### Name: has_warning
### Title: Check if an R expression produces warnings or errors
### Aliases: has_warning has_error

### ** Examples

has_warning(1 + 1)
has_warning(1:2 + 1:3)

has_error(2 - 3)
has_error(1 + "a")



