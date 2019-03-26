library(nanop)


### Name: simPart
### Title: Functions to simulate the atomic positions in a nanoparticle
### Aliases: simPart displacePart
### Keywords: simulation

### ** Examples

## Uncomment all plotPart() calls for 3D visualization

## create CdSe nanoparticle:
## CdSe particle has wurtzite structure
## Zn and S atoms could be used to create base matrix
## (see getBase() )
Cd_base <- getBase("Zn")  #get fractional coordinates for Zn
Cd_scL <- getScatterLength("Cd") #get scattering parameters for Cd
Cd_scF <- getScatterFactor("Cd")

Cd <- createAtom("Cd", base=Cd_base, scatterLength=Cd_scL, 
    scatterFactor=Cd_scF, sigma=0.01)

Se_base <- getBase("S")
Se_scL <- getScatterLength("Se")
Se_scF <- getScatterFactor("Se")

Se <- createAtom("Se", base=Se_base, scatterLength=Se_scL, 
    scatterFactor=Se_scF, sigma=0.008)

## atoms Cd and Se now can be used as arguments in simPart
part <- simPart(atoms=list(Cd, Se), latticep=c(4.3, 7.02), 
    sym="hcp")
#plotPart(part)

## Deterministic particle 
## Particle with uniform displacements 
Cu <- createAtom("Cu")
part <- simPart(atoms=list(Cu), atomsShell=list(Cu), rcore=8, 
    latticep=5)
partx <- displacePart(part, sigma=.02) 
#plotPart(partx, radius=.4, box=TRUE)

## Particle with displacements in the core different 
## from displacements in the shell
## create rock salt structure
Zn <- createAtom("Zn")
S <- createAtom("S")
part <- simPart(atoms=list(Zn,S), atomsShell=list(Cd, Se), r=14, 
    rcore=10, sym="hcp", latticep=c(3.1, 4.1), symShell="hcp", 
    latticepShell=c(4.3, 7.02))
partx <- displacePart(part, sigma=c(.01, .005, .012, .012)) 
## first elements in sigma and correspond to Zn atoms,
## second - to S atoms, third - to Cd atoms, last - to Se atoms.
attributes(part)$atomType
## elements '1' indicate Zn atoms in the total matrix, '2' indicate  
## S atoms, '-1' indicate Cd atoms, and '-2' indicate Se atoms.
#plotPart(partx, radius=.4)

## Particles with radii drawn from a log-Normal size-distribution
## and constant thickness 0.8
r <- exp(rnorm(10, log(10), log(1.1)))
part <- simPart(r=r, shell=0.8, atoms=list(Cu), 
    atomsShell=list(Cu))
## particle attributes
attributes(part)
## Extract second subparticle
t1 <- attributes(part)$layer_start[2]
t2 <- attributes(part)$layer_end[2]
part2 <- part[t1:t2, ]
## In order to use part2 as an argument for calcTotalScatt() or  
## other functions certain attributes should be set up 
## (see calcTotalScatt).
## To avoid extraction of every subparticle use option 
##  kind="fast_av" in calcTotalScatt() function.




