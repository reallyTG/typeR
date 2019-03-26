library(broman)


### Name: compare_rows
### Title: Compare rows in a matrix
### Aliases: compare_rows

### ** Examples

n <- 10
p <- 200
x <- matrix(sample(1:4, n*p, replace=TRUE), ncol=p)
d <- compare_rows(x)



