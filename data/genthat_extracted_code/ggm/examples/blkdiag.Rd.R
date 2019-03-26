library(ggm)


### Name: blkdiag
### Title: Block diagonal matrix
### Aliases: blkdiag
### Keywords: matrix

### ** Examples

X <- c(1,1,2,2); Z <- c(10, 20, 30, 40); A <- factor(c(1,2,2,2))
blkdiag(model.matrix(~X+Z), model.matrix(~A))



