library(RandomFields)


### Name: RMangle
### Title: Anisotropy matrix given by angle
### Aliases: RMangle
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp(Aniso=RMangle(angle=pi/4, ratio=3))
plot(model, dim=2)

x <- seq(0, 2, 0.05)
z <- RFsimulate(x, x, model=model)
plot(z)


model <- RMexp(Aniso=RMangle(angle=pi/4, lat.angle=pi/8, diag=c(1,2,3)))
x <- seq(0, 2, 0.2)
z <- RFsimulate(x, x, x, model=model)
plot(z, MARGIN.slices=3)


## next model gives an example how to estimate the parameters back
n <- 20
x <- runif(n, 0, 10)
y <- runif(n, 0, 10)
coords <- expand.grid(x, y)
model <- RMexp(Aniso=RMangle(angle=pi/4, diag=c(1/4, 1/12)))
d <- RFsimulate(model, x=coords[, 1], y=coords[, 2], n=10)
estmodel <- RMexp(Aniso=RMangle(angle=NA, diag=c(NA, NA)))
system.time(RFfit(estmodel, data=d, modus_operandi='sloppy'))

## Don't show: 
FinalizeExample()
## End(Don't show)


