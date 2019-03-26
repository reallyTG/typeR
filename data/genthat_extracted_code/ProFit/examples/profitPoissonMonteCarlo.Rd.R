library(ProFit)


### Name: profitPoissonMonteCarlo
### Title: Monte Carlo sample an image assuming Poisson-distributed counts
### Aliases: profitPoissonMonteCarlo
### Keywords: monte, carlo, random, Poisson

### ** Examples

## Not run: 
##D disk = profitMakeModel(modellist=list(sersic=list(xcen=50,ycen=50,mag=15,re=5,nser=1,
##D axrat=0.5,ang=125,box=0)))$z
##D gain = 1e13
##D magimage(profitPoissonMonteCarlo(disk*gain))
## End(Not run)



