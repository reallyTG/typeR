library(tester)


### Name: is_diagonal
### Title: Is diagonal matrix
### Aliases: is_diagonal is_not_diagonal

### ** Examples

m1 = diag(1:3, 3, 3)
m2 = matrix(1:9, 3, 3)

is_diagonal(m1) # TRUE
is_diagonal(m2) # FALSE
is_not_diagonal(m2) # TRUE



