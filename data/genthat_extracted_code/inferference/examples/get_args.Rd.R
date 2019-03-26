library(inferference)


### Name: get_args
### Title: Get arguments from a function
### Aliases: get_args

### ** Examples

myargs <- get_args(lm, formula = Sepal.Length ~ Sepal.Width, data = iris )
summary(do.call('lm', myargs))



