library(tester)


### Name: list_of_vectors
### Title: List of vectors
### Aliases: list_of_logical_vectors list_of_numeric_vectors
###   list_of_string_vectors list_of_vectors

### ** Examples

a = list(1:3, letters[1:3], c(exp(1), pi), NA)
b = list(1:3, c(exp(1), pi))
d = list(letters[1:3], 'bonjour a tous')
e = list(matrix(1:6, 2, 3), a, b)

list_of_vectors(a) # TRUE
list_of_vectors(b) # TRUE
list_of_vectors(d) # TRUE
list_of_vectors(e) # FALSE

list_of_numeric_vectors(a) # FALSE
list_of_numeric_vectors(b) # TRUE

list_of_string_vectors(a) # FALSE
list_of_string_vectors(d) # TRUE

list_of_logical_vectors(a) # FALSE
list_of_logical_vectors(d) # TRUE



