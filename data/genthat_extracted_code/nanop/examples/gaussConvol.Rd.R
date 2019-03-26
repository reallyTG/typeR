library(nanop)


### Name: gaussConvol
### Title: Gauss convolution
### Aliases: gaussConvol
### Keywords: simulation

### ** Examples

## simulate a particle 
Cu <- createAtom("Cu")
part <- simPart(atoms=list(Cu), atomsShell=list(Cu), r=20, 
    rcore=14, latticep=4.08, latticepShell=3.89)

## calculate total scattering function
gQ <- calcTotalScatt(part, type="neutron",  minQ=0.771, maxQ=18,
    dQ=0.01, scatterLength=c(4.87, 7.97), sigma=c(.01, .01))
plot(gQ$Q, gQ$gQ, type="l")
						  
## simulate instrumental resolution effect
Q <- gQ$Q
gQ <- gaussConvol(SQ=gQ$gQ, Q=gQ$Q, Qdamp=0.061, err=1e-5)
lines(Q, gQ, col=2)		   



