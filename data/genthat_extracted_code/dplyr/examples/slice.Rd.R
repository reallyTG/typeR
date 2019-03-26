library(dplyr)


### Name: slice
### Title: Choose rows by position
### Aliases: slice

### ** Examples

slice(mtcars, 1L)
# Similar to tail(mtcars, 1):
slice(mtcars, n())
slice(mtcars, 5:n())
# Rows can be dropped with negative indices:
slice(mtcars, -5:-n())
# In this case, the result will be equivalent to:
slice(mtcars, 1:4)

by_cyl <- group_by(mtcars, cyl)
slice(by_cyl, 1:2)

# Equivalent code using filter that will also work with databases,
# but won't be as fast for in-memory data. For many databases, you'll
# need to supply an explicit variable to use to compute the row number.
filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()))



