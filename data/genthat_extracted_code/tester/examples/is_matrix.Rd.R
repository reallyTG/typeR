library(tester)


### Name: is_matrix
### Title: Is matrix
### Aliases: is_logical_matrix is_matrix is_not_matrix is_numeric_matrix
###   is_string_matrix

### ** Examples

A = matrix(1:10, 5, 2)
B = matrix(letters[1:10], 5, 2)
C = 1:10

is_matrix(A) # TRUE
is_matrix(C) # FALSE
is_not_matrix(C) # TRUE

is_numeric_matrix(A) # TRUE
is_numeric_matrix(B) # FALSE

is_string_matrix(A) # FALSE
is_string_matrix(B) # TRUE



