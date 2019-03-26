library(haplo.stats)


### Name: Ginv
### Title: Compute Generalized Inverse of Input Matrix
### Aliases: Ginv
### Keywords: matrix

### ** Examples

# for matrix x, extract the generalized inverse and 
# rank of x as follows
    x <- matrix(c(1,2,1,2,3,2),ncol=3)
    save <- Ginv(x)
    ginv.x <- save$Ginv
    rank.x <- save$rank



