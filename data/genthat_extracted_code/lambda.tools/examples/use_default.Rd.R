library(lambda.tools)


### Name: use_default
### Title: Apply a default value whenever a variable is not well-formed
### Aliases: use_default

### ** Examples

x <- c(1, 2, 3, NA, NA)
map(x, function(y) use_default(y, 0))



