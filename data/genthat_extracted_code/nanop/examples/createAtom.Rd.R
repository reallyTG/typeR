library(nanop)


### Name: createAtom
### Title: Describe fractional coordinates and scattering parameters of the
###   basis atoms
### Aliases: createAtom
### Keywords: simulation

### ** Examples

## create CdSe nanoparticle:
## CdSe particle has wurtzite structure
## Zn and S atoms could be used to describe
## basis atoms fractional coordinates
## (see getBase() )

## get fractional coordinates for Zn
Cd_base <- getBase("Zn")  
## get scattering parameters for Cd
Cd_scL <- getScatterLength("Cd") 
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
## uncomment to plot particle:
#plotPart(part)

## create rock salt structure
Na <- createAtom("Na")
Cl <- createAtom("Cl")
## name, scatterLength and scatterFactor parameters
## in Na and Cl are now set up to those of Na and Cl.
## if we are interested only in particle structure
## or actually simulating rock salt there is no need
## to change them
part <- simPart(atoms=list(Na, Cl))
#plotPart(part)

## set up fractional coordinates that cannot be
## simulated by getBase()
## (for example we have ZnS wurtzite structure 
## with atom S z-coordinate 0.378
## different from ideal value of 0.375 (3/8) ):

S_base <- matrix(c(
      c(0.5,  sqrt(3)/6, 0.378),  #S
	  c(0.5,  -sqrt(3)/6,  (0.378-0.5))),
      ncol=3, byrow=TRUE)
## each row represents fractional atomic coordinates in the primitive cell
S2 <- createAtom("S", base=S_base)
## use standard parameters for Zn atoms
Zn <- createAtom("Zn")
part <- simPart(atoms=list(Zn, S2), latticep=c(4.3,7.02), sym="hcp")
#plotPart(part)
   



