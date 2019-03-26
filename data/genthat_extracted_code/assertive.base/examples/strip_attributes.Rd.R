library(assertive.base)


### Name: strip_attributes
### Title: Strip all attributes from a variable
### Aliases: strip_attributes

### ** Examples

x <- structure(c(foo = 1, bar = 2), some_attr = 3)
x2 <- strip_attributes(x)
attributes(x)
attributes(x2)



