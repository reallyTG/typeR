library(GpGp)


### Name: L_mult
### Title: Multiply approximate Cholesky by a vector
### Aliases: L_mult

### ** Examples

n <- 2000
locs <- matrix( runif(2*n), n, 2 )
covparms <- c(2, 0.2, 0.75, 0.1)
ord <- order_maxmin(locs)
NNarray <- find_ordered_nn(locs,20)
Linv <- vecchia_Linv( covparms, "matern_isotropic", locs, NNarray )
z <- rnorm(n)
y1 <- fast_Gp_sim_Linv(Linv,NNarray,z)
y2 <- L_mult(Linv, z, NNarray)
print( sum( (y1-y2)^2 ) )



