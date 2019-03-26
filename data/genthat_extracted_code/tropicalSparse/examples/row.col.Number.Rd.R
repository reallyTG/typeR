library(tropicalSparse)


### Name: row.col.Number
### Title: Row/Column Number of a Value
### Aliases: row.col.Number

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)

List = tropicalsparse.storage(a,'csr','minplus')
i = 2
row.col.Number(i, nrow(a), List[[1]])
# [1] 2



