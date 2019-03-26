library(dynutils)


### Name: expand_matrix
### Title: Expand a matrix with given rownames and colnames
### Aliases: expand_matrix

### ** Examples

x <- matrix(runif(12), ncol = 4, dimnames = list(c("a", "c", "d"), c("D", "F", "H", "I")))
expand_matrix(x, letters[1:5], LETTERS[1:10], fill = 0)



