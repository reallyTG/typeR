library(tidytext)


### Name: cast_sparse
### Title: Create a sparse matrix from row names, column names, and values
###   in a table.
### Aliases: cast_sparse

### ** Examples


dat <- data.frame(a = c("row1", "row1", "row2", "row2", "row2"),
                  b = c("col1", "col2", "col1", "col3", "col4"),
                  val = 1:5)

cast_sparse(dat, a, b)

cast_sparse(dat, a, b, val)




