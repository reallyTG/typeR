library(bazar)


### Name: get_vars
### Title: Get formula variables
### Aliases: get_vars

### ** Examples

get_vars(y ~ x1 + x2 - x1)
get_vars(y ~ . - x1, data = data.frame(y = 1, x1 = 2, x2 = 3))
get_vars(y + z ~ x1 + x2 - x1 | x3)
get_vars(y ~ x1 + I(log(x2)))
get_vars(y ~ x1*x2)
get_vars(y ~ x1:x2)
get_vars(~ x1 + x2)




