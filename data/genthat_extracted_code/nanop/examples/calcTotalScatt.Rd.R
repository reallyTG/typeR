library(nanop)


### Name: calcTotalScatt
### Title: Functions to calculate the total scattering structure function
### Aliases: calcTotalScatt IqSAS IqSASP
### Keywords: simulation

### ** Examples


## simulate particle
Au <- createAtom("Cu")
Au$name <- "Au"
Pd <- createAtom("Cu")
Pd$name <- "Pd"

part <- simPart(list(Au), atomsShell=list(Pd), r=10, rcore=8)
gQ <- calcTotalScatt(part, type="neutron", sigma=c(.08, .012), 
    kind="fast", del=5e-4)
plot(gQ$Q, gQ$gQ, type="l")

## "fast_av" option to calculate scattering function
## for the array of polydisperse particles:
Zn <- createAtom("Zn")
S <- createAtom("S")
part <- simPart(atoms=list(Zn, S), r=c(8, 10, 11.2, 13.4, 14), 
    sym="hcp", latticep=c(4.3, 7.02))
gQ <- calcTotalScatt(part, type="neutron", sigma=c(.08, .012), 
    kind="fast_av")
plot(gQ$Q, gQ$gQ, type="l")

## total scattering function in small-angle region using 
##  parametric model:
Q=seq(0.001, 0.771, 0.005)
gQSAS <- IqSAS(Q=Q, Rpart=26, latticep=c(3.21, 5.21), 
    scatterLength=7.1, N1=2, sym="hcp")
plot(Q, log(abs(gQSAS)), type="l")

## total scattering function for polydisperse sample with 
## lognormal distribution
gQSAS2 <- IqSASP(Q=Q, shell=2.8, Rpart=11.2, latticep=c(4.08), 
    latticepShell=3.89, N1=4, N2=4, scatterLength=c(7.1, 8.3),
    sym="fcc", symShell="fcc", rsigma=1.1)
plot(Q, log(abs(gQSAS2)), type="l")




