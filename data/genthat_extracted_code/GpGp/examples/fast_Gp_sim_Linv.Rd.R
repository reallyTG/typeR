library(GpGp)


### Name: fast_Gp_sim_Linv
### Title: Approximate GP simulation with specified Linverse
### Aliases: fast_Gp_sim_Linv

### ** Examples

locs <- as.matrix( expand.grid( (1:100)/100, (1:100)/100 ) )
ord <- order_maxmin(locs)
locsord <- locs[ord,]
m <- 10
NNarray <- find_ordered_nn(locsord,m)
covparms <- c(2, 0.2, 1, 0)
Linv <- vecchia_Linv( covparms, "matern_isotropic", locsord, NNarray )
y <- fast_Gp_sim_Linv(Linv,NNarray)
y[ord] <- y
fields::image.plot( matrix(y,100,100) )



