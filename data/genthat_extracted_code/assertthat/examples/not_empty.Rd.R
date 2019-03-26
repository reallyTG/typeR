library(assertthat)


### Name: not_empty
### Title: Check an object doesn't have any empty dimensions
### Aliases: not_empty

### ** Examples

not_empty(numeric())
not_empty(mtcars[0, ])
not_empty(mtcars[, 0])



