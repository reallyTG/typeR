library(tester)


### Name: has_rownames
### Title: Has or lacks row/column names?
### Aliases: has_colnames has_dimnames has_rownames lacks_colnames
###   lacks_dimnames lacks_rownames

### ** Examples

has_rownames(iris) # TRUE
has_colnames(iris) # TRUE

lacks_rownames(letters[1:10]) # TRUE
lacks_colnames(letters[1:10]) # TRUE

A = matrix(1:10)
has_dimnames(A) # FALSE
lacks_dimnames(A) # TRUE



