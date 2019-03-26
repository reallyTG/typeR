library(bio3d)


### Name: plot.dmat
### Title: Plot Distance Matrix
### Aliases: plot.dmat
### Keywords: hplot

### ** Examples


# Read PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

# DM
d <- dm(pdb,"calpha")

# Plot DM
##filled.contour(d, nlevels = 4)
##plot(d)
plot(d,
     resnum.1 = pdb$atom[pdb$calpha,"resno"],
     color.palette = mono.colors,
     xlab="Residue Number", ylab="Residue Number")

## Not run: 
##D # Download and align two PDB files
##D pdbs <- pdbaln( get.pdb( c( "4q21", "521p"), path=tempdir(), overwrite=TRUE))
##D 
##D # Get distance matrix
##D a <- dm.xyz(pdbs$xyz[1,])
##D b <- dm.xyz(pdbs$xyz[2,])
##D 
##D # Calculate DDM
##D c <- a - b
##D 
##D # Plot DDM
##D plot(c,key=FALSE, grid=FALSE)
##D 
##D plot(c, axis.tick.space=10,
##D      resnum.1=pdbs$resno[1,],
##D      resnum.2=pdbs$resno[2,],
##D      grid.col="black",
##D      xlab="Residue No. (4q21)", ylab="Residue No. (521p)")
##D 
## End(Not run)



