library(bio3d)


### Name: dm
### Title: Distance Matrix Analysis
### Aliases: dm dm.pdb dm.xyz dm.pdbs
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

##--- Distance Matrix Plot
pdb <- read.pdb( "4q21" )
k <- dm(pdb,inds="calpha")
filled.contour(k, nlevels = 10)

## NOTE: FOLLOWING EXAMPLE NEEDS MUSCLE INSTALLED
if(check.utility("muscle")) {

##--- DDM: Difference Distance Matrix
# Downlaod and align two PDB files
pdbs <- pdbaln( get.pdb( c( "4q21", "521p"), path = tempdir() ), outfile = tempfile() )

# Get distance matrix
a <- dm.xyz(pdbs$xyz[1,])
b <- dm.xyz(pdbs$xyz[2,])

# Calculate DDM
c <- a - b

# Plot DDM
plot(c,key=FALSE, grid=FALSE)

plot(c, axis.tick.space=10,
     resnum.1=pdbs$resno[1,],
     resnum.2=pdbs$resno[2,],
     grid.col="black",
     xlab="Residue No. (4q21)", ylab="Residue No. (521p)")
}
## End(No test)

## Not run: 
##D ##-- Residue-wise distance matrix based on the
##D ##   minimal distance between all available atoms
##D l <- dm.xyz(pdb$xyz, grpby=pdb$atom[,"resno"], scut=3)
## End(Not run)



