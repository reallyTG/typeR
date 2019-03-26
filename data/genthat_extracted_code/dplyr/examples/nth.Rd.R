library(dplyr)


### Name: nth
### Title: Extract the first, last or nth value from a vector
### Aliases: nth first last

### ** Examples

x <- 1:10
y <- 10:1

first(x)
last(y)

nth(x, 1)
nth(x, 5)
nth(x, -2)
nth(x, 11)

last(x)
# Second argument provides optional ordering
last(x, y)

# These functions always return a single value
first(integer())



