library(tester)


### Name: is_tabular
### Title: Is tabular
### Aliases: is_not_tabular is_numeric_tabular is_string_tabular is_tabular

### ** Examples

A = matrix(1:10, 5, 2)
B = matrix(letters[1:10], 5, 2)
C = 1:10

is_tabular(A) # TRUE
is_tabular(iris) # TRUE

is_numeric_tabular(A) # TRUE
is_numeric_tabular(iris) # FALSE
is_numeric_dataframe(iris[,1:4]) # TRUE



