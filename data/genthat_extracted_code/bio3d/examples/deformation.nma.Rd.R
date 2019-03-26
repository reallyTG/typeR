library(bio3d)


### Name: deformation.nma
### Title: Deformation Analysis
### Aliases: deformation.nma
### Keywords: analysis

### ** Examples

## No test: 
# Running the example takes some time - testing excluded

## Fetch stucture
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate (vibrational) normal modes
modes <- nma(pdb)

## Calculate deformation energies
def.energies <- deformation.nma(modes)
## End(No test)

## Not run: 
##D ## Fluctuations of first non-trivial mode
##D def.energies <- deformation.nma(modes, mode.inds=seq(7, 16))
##D 
##D write.pdb(pdb=NULL, xyz=modes$xyz,
##D           b=def.energies$ei[,1])
## End(Not run)



