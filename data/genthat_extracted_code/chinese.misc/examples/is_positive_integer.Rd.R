library(chinese.misc)


### Name: is_positive_integer
### Title: A Convenient Version of is.integer
### Aliases: is_positive_integer

### ** Examples

is_positive_integer(NULL)
is_positive_integer(as.integer(NA))
is_positive_integer(integer(0))
is_positive_integer(3.0)
is_positive_integer(3.3)
is_positive_integer(1:5)
is_positive_integer(1:5, len = c(2, 10))
is_positive_integer(1:5, len = c(2:10))



