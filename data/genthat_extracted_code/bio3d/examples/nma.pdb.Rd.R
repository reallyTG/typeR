library(bio3d)


### Name: nma.pdb
### Title: Normal Mode Analysis
### Aliases: nma.pdb build.hessian print.nma
### Keywords: analysis

### ** Examples

## Fetch stucture
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate normal modes
modes <- nma(pdb)

## Print modes
print(modes)

## Plot modes
plot(modes)

## Visualize modes
#m7 <- mktrj.nma(modes, mode=7, file="mode_7.pdb")

## Not run: 
##D ## Use Anisotropic Network Model
##D modes <- nma(pdb, ff="anm", mass=FALSE, temp=NULL, cutoff=15)
##D 
##D ## Use SSE information and SS-bonds
##D sse      <- dssp(pdb, resno=FALSE, full=TRUE)
##D ss.bonds <- matrix(c(76,94, 64,80, 30,115, 6,127),
##D                    ncol=2, byrow=TRUE)
##D 
##D 
##D ## User defined energy function
##D ## Note: Must take a vector of distances
##D "my.ff" <- function(r) {
##D    ifelse( r>15, 0, 1 )
##D }
##D 
##D ## Modes with a user defined energy function
##D modes <- nma(pdb, pfc.fun=my.ff)
##D 
##D 
##D ## A more manual approach
##D sele <- atom.select(pdb, chain='A', elety='CA')
##D xyz <- pdb$xyz[sele$xyz]
##D 
##D hessian <- build.hessian(xyz, my.ff)
##D modes <- eigen(hessian)
##D 
##D ## Dealing with unconventional residues
##D pdb <- read.pdb("1xj0")
##D 
##D ## nma(pdb)
##D #modes <- nma(pdb, mass.custom=list(CSX=121.166))
## End(Not run)



