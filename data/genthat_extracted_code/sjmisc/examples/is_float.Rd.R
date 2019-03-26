library(sjmisc)


### Name: is_float
### Title: Check if a variable is of (non-integer) double type or a whole
###   number
### Aliases: is_float is_whole

### ** Examples

data(mtcars)
data(iris)

is.double(4)
is_float(4)
is_float(4.2)
is_float(iris)

is_whole(4)
is_whole(4.2)
is_whole(mtcars)





