library(tester)


### Name: is_vector
### Title: Is vector
### Aliases: is_logical_vector is_not_vector is_numeric_vector
###   is_string_vector is_vector

### ** Examples

a = 1:10
b = letters[1:10]
d = matrix(1:10, 5, 2)

is_vector(a) # TRUE
is_vector(b) # TRUE
is_vector(d) # FALSE
is_not_vector(d) # TRUE

is_numeric_vector(a) # TRUE
is_numeric_vector(b) # FALSE

is_string_vector(a) # FALSE
is_string_vector(b) # TRUE



