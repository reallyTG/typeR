library(validate)


### Name: all,validation-method
### Title: Test if all validations resulted in TRUE
### Aliases: all,validation-method

### ** Examples

val <- check_that(women, height>60, weight>0)
all(val)



