library(gstat)


### Name: fit.variogram
### Title: Fit a Variogram Model to a Sample Variogram
### Aliases: fit.variogram
### Keywords: models

### ** Examples

library(sp)
data(meuse)
coordinates(meuse) = ~x+y
vgm1 <- variogram(log(zinc)~1, meuse)
fit.variogram(vgm1, vgm(1, "Sph", 300, 1))
fit.variogram(vgm1, vgm("Sph"))

# optimize the value of kappa in a Matern model, using ugly <<- side effect:
f = function(x) attr(m.fit <<- fit.variogram(vgm1, vgm(,"Mat",nugget=NA,kappa=x)),"SSErr")
optimize(f, c(0.1, 5))
plot(vgm1, m.fit)
# best fit from the (0.3, 0.4, 0.5. ... , 5) sequence:
(m <- fit.variogram(vgm1, vgm("Mat"), fit.kappa = TRUE))
attr(m, "SSErr")



