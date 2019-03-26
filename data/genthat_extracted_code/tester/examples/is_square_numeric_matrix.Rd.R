library(tester)


### Name: is_square_numeric_matrix
### Title: Is square numeric matrix
### Aliases: is_not_square_numeric_matrix is_square_numeric_matrix

### ** Examples

# numeric matrices
m1 = matrix(1:9, 3, 3)
m2 = matrix(1:12, 4, 3)

is_square_numeric_matrix(m1)  # TRUE
is_square_numeric_matrix(m2)  # FALSE
is_not_square_numeric_matrix(m2)  # TRUE

# non-numeric matrices
str_mat = matrix(letters[1:9], 3, 3)
log_mat = matrix(rep_len(c(TRUE, FALSE), 9), 3, 3)

is_square_numeric_matrix(str_mat)  # FALSE
is_square_numeric_matrix(log_mat)  # FALSE
is_not_square_numeric_matrix(str_mat)  # TRUE



