library(tropicalSparse)


### Name: tropicalsparse.storage
### Title: Storage Techniques
### Aliases: tropicalsparse.storage

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

tropicalsparse.storage(a, 'coo', 'minplus')

# $row_Indices_COO
# [1] 1 2 3

# $col_Indices_COO
# [1] 1 1 2

# $values_COO
# [1]  2  0 10




