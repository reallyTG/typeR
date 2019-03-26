library(bio3d)


### Name: cmap
### Title: Contact Map
### Aliases: cmap cmap.default cmap.xyz cmap.pdb
### Keywords: utilities

### ** Examples


##- Read PDB file
pdb <- read.pdb( system.file("examples/hivp.pdb", package="bio3d") )

## Atom Selection indices
inds <- atom.select(pdb, "calpha")

## Reference contact map
ref.cont <- cmap( pdb$xyz[inds$xyz], dcut=6, scut=3 )
plot.cmap(ref.cont)

## Not run: 
##D ##- Read Traj file
##D trj <- read.dcd( system.file("examples/hivp.dcd", package="bio3d") )
##D ## For each frame of trajectory
##D sum.cont <- NULL
##D for(i in 1:nrow(trj)) {
##D 
##D   ## Contact map for frame 'i'
##D   cont <- cmap(trj[i,inds$xyz], dcut=6, scut=3)
##D 
##D   ## Product with reference
##D   prod.cont <- ref.cont * cont
##D   sum.cont <- c(sum.cont, sum(prod.cont,na.rm=TRUE))
##D }
##D 
##D plot(sum.cont, typ="l")
## End(Not run)



