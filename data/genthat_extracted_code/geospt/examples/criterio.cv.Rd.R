library(geospt)


### Name: criterio.cv
### Title: Cross-validation summaries
### Aliases: criterio.cv
### Keywords: spatial

### ** Examples

library(gstat)
data(meuse) 
coordinates(meuse) <- ~x+y 
m <- vgm(.59, "Sph", 874, .04) 

# leave-one-out cross validation: 
out <- krige.cv(log(zinc)~1, meuse, m, nmax = 40) 
criterio.cv(out)

# multiquadratic function
data(preci)
coordinates(preci) <- ~x+y

# predefined eta
tab <- rbf.tcv(prec~x+y,preci,eta=1.488733, rho=0, n.neigh=9, func="M") 
criterio.cv(tab)



