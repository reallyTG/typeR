library(GpGp)


### Name: vecchia_Linv
### Title: Inverse Cholesky factor implied by Vecchia's approximation
### Aliases: vecchia_Linv

### ** Examples

n1 <- 40
n2 <- 40
n <- n1*n2
locs <- as.matrix( expand.grid( (1:n1)/n1, (1:n2)/n2 ) )
covparms <- c(2, 0.2, 0.75, 0)
ord <- order_maxmin(locs)
NNarray <- find_ordered_nn(locs,20)
Linv <- vecchia_Linv( covparms, "matern_isotropic", locs, NNarray )



