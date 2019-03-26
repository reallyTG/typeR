library(actuar)


### Name: unroll
### Title: Display a Two-Dimension Version of a Matrix of Vectors
### Aliases: unroll
### Keywords: manip

### ** Examples

x <- list(c(1:3), c(1:8), c(1:4), c(1:3))
(mat <- matrix(x, 2, 2))

unroll(mat)
unroll(mat, bycol = TRUE)

unroll(mat[1, ])
unroll(mat[1, ], drop = FALSE)



