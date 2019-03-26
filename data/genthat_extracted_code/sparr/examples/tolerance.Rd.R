library(sparr)


### Name: tolerance
### Title: Tolerance by _p_-value surfaces
### Aliases: tolerance

### ** Examples


## No test: 

data(pbc)
h0 <- LSCV.risk(pbc,method="hazelton");h0
pbccas <- split(pbc)[[1]]
pbccon <- split(pbc)[[2]]

# ASY
riskfix <- risk(pbc,h0=h0)
fixtol1 <- tolerance(riskfix,ref.density=density(pbc,OS(pbc)))

riskada <- risk(pbc,h0=h0,adapt=TRUE,hp=NS(pbc),pilot.symmetry="pooled",davies.baddeley=0.025)
adatol1 <- tolerance(riskada)

par(mfrow=c(1,2))
plot(riskfix)
tol.contour(fixtol1,levels=c(0.1,0.05,0.01),lty=3:1,add=TRUE)
plot(riskada)
tol.contour(adatol1,levels=c(0.1,0.05,0.01),lty=3:1,add=TRUE)


# MC
fixtol2 <- tolerance(riskfix,method="MC",ITER=200) 
adatol2 <- tolerance(riskada,method="MC",ITER=200,parallelise=4) # ~1 minute with parallelisation
par(mfrow=c(1,2))
plot(riskfix)
tol.contour(fixtol2,levels=c(0.1,0.05,0.01),lty=3:1,add=TRUE)
plot(riskada)
tol.contour(adatol2,levels=c(0.1,0.05,0.01),lty=3:1,add=TRUE)
## End(No test)





