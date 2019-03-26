library(nanop)


### Name: plotPart
### Title: Draws a three-dimensional scatterplot
### Aliases: plotPart
### Keywords: visualization

### ** Examples

## rgl library demands graphical terminal to be available
## uncoment all plotPart() calls for 3D visualization
## simulate particle
Au <- createAtom("Cu")
Au$name <- "Au"
Pd <- createAtom("Cu")
Pd$name <- "Pd"
part <- simPart(atoms=list(Au), atomsShell=list(Pd), rcore=8)
## 3d scatter plot
#plotPart(part, col=c(2,4))

## increase number of atom types within the particle:
Zn <- createAtom("Zn")
S <- createAtom("S")
part <- simPart(atoms=list(Zn ,S), atomsShell=list(Au), r=14, 
    rcore=12, sym="hcp", symShell="fcc", latticep=c(4.3, 7.04), 
    latticepShell=4.08)
## 3d scatter plot
#plotPart(part, col=c(2,4,3))
## play animation:
#plotPart(part, col=c(2,4,3), play=TRUE)

## plot only shell particles
#plotPart(part, col=c(2,4,3), atoms="shell Au", play=TRUE)

part <- simPart(atoms=list(Zn ,S),r=20, sym="hcp", 
    latticep=c(4.3, 7.04))
## display plane normal to z-axis:
#plotPart(part, miller=c(0, 0, 0 ,1), lattice=c(4.3, 7.04))
##S atoms:
#plotPart(part, miller=c(0, 0, 0 ,1), lattice=c(4.3, 7.04), 
#    atoms = "core S")
## save picture in a file using rgl function:
#rgl.snapshot( filename = "plane0001 S atoms.png")

Na <- createAtom("Na")
Cl <- createAtom("Cl")
part <- simPart(atoms=list(Na,Cl), sym="fcc")
#plotPart(part, miller=c(1,0,1), box=TRUE, lattice=c(4.08))
## plot only Na atoms:
#plotPart(part, miller=c(1,0,1), box=TRUE, lattice=c(4.08), 
#    atoms = "core Na")



