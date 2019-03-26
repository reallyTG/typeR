library(lenses)


### Name: to_l
### Title: Promote a function to a 'getter' lens
### Aliases: to_l

### ** Examples

# This wouldn't make sense as a general legal lens, but fine as a `getter`
sqrt_l <- to_l(sqrt)
iris_root <- index(1) %.% index(1) %.% sqrt_l

sqrt(iris[[1]][[1]])
iris %>% view(iris_root)
tryCatch(iris %>% set(iris_root, 2)
       , error = function(e) "See, can't do that")




