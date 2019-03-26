library(GpGp)


### Name: fast_Gp_sim
### Title: Approximate GP simulation
### Aliases: fast_Gp_sim

### ** Examples

locs <- as.matrix( expand.grid( (1:100)/100, (1:100)/100 ) )
y <- fast_Gp_sim(c(4,0.2,0.5,0), "matern_isotropic",  locs, 30 )
fields::image.plot( matrix(y,100,100) )



