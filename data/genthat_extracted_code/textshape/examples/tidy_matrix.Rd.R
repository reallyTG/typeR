library(textshape)


### Name: tidy_matrix
### Title: Convert a Matrix into Tidy Form
### Aliases: tidy_matrix tidy_adjacency_matrix

### ** Examples

mat <- matrix(1:16, nrow = 4,
    dimnames = list(LETTERS[1:4], LETTERS[23:26])
)

mat
tidy_matrix(mat)


data(simple_dtm)
tidy_matrix(as.matrix(simple_dtm), 'doc', 'term', 'n')

X <- as.matrix(simple_dtm[1:10, 1:10])
tidy_adjacency_matrix(crossprod(X))
tidy_adjacency_matrix(crossprod(t(X)))



