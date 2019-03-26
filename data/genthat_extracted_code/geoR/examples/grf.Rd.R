library(geoR)


### Name: grf
### Title: Simulation of Gaussian Random Fields
### Aliases: grf geoR2RF .grf.aux1 grfclass lines.grf
### Keywords: spatial datagen

### ** Examples

sim1 <- grf(100, cov.pars = c(1, .25))
# a display of simulated locations and values
points(sim1)   
# empirical and theoretical variograms
plot(sim1)
## alternative way
plot(variog(sim1, max.dist=1))
lines.variomodel(sim1)
#
# a "smallish" simulation
sim2 <- grf(441, grid = "reg", cov.pars = c(1, .25)) 
image(sim2)
##
## 1-D simulations using the same seed and different noise/signal ratios
##
set.seed(234)
sim11 <- grf(100, ny=1, cov.pars=c(1, 0.25), nug=0)
set.seed(234)
sim12 <- grf(100, ny=1, cov.pars=c(0.75, 0.25), nug=0.25)
set.seed(234)
sim13 <- grf(100, ny=1, cov.pars=c(0.5, 0.25), nug=0.5)
##
par.ori <- par(no.readonly = TRUE)
par(mfrow=c(3,1), mar=c(3,3,.5,.5))
yl <- range(c(sim11$data, sim12$data, sim13$data))
image(sim11, type="l", ylim=yl)
image(sim12, type="l", ylim=yl)
image(sim13, type="l", ylim=yl)
par(par.ori)

## simulating within borders
data(parana)
pr1 <- grf(100, cov.pars=c(200, 40), borders=parana$borders, mean=500)
points(pr1)
pr1 <- grf(100, grid="reg", cov.pars=c(200, 40), borders=parana$borders)
points(pr1)
pr1 <- grf(100, grid="reg", nx=10, ny=5, cov.pars=c(200, 40), borders=parana$borders)
points(pr1)



