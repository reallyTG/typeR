library(futile.matrix)


### Name: expand
### Title: Expand a matrix to larger dimensions, filling in new entries
### Aliases: expand
### Keywords: array

### ** Examples

rows.m <- c('row.1', 'row.2', 'row.3')
cols.m <- c('col.1', 'col.2')
rows.n <- c(rows.m, 'row.4')
cols.n <- c(cols.m, 'col.3')
m <- matrix(c(1,4,7,2,5,8), ncol=2, dimnames=list(rows.m,cols.m))
n <- matrix(c(1,4,7,10,2,5,8,11,3,6,9,12), ncol=3,
  dimnames=list(rows.n,cols.n))
expand(m, n)



