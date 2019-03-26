library(aucm)


### Name: sauc.phi
### Title: sauc.phi
### Aliases: sauc.phi phi.f vcov.sauc

### ** Examples


seed=26
seed=16
seed=3
dat.train = sim.dat.1(n=200, seed=seed, add.outliers=TRUE) 
fits=list()
fits[[1]]=sauc.phi(y~x1+x2, dat.train,constrain.method="L2",h.method="Lin")
fits[[2]]=sauc.phi(y~x1+x2, dat.train,constrain.method="L2",h.method="MH")
fits[[3]]=sauc.phi(y~x1+x2, dat.train,constrain.method="beta1",h.method="Lin")
fits[[4]]=sauc.phi(y~x1+x2, dat.train,constrain.method="beta1",h.method="MH") 
# not a good combination of constrain.method and h.method
sapply(fits, function(x) ratio(x)[2])


# explosion
seed=954
dat.train = sim.dat.1(n=200, seed=seed, add.outliers=TRUE) 
fit.1 = sauc.phi(y~x1+x2, dat.train,constrain.method="L2",h.method="Lin")
ratio(fit.1)





