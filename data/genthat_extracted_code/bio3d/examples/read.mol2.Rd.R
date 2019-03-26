library(bio3d)


### Name: read.mol2
### Title: Read MOL2 File
### Aliases: read.mol2 print.mol2
### Keywords: IO

### ** Examples

cat("\n")
## Not run: 
##D ## Read a single entry MOL2 file
##D ## (returns a single object)
##D mol <- read.mol2( system.file("examples/aspirin.mol2", package="bio3d") )
##D 
##D ## Short summary of the molecule
##D print(mol)
##D 
##D ## ATOM records
##D mol$atom
##D 
##D ## BOND records
##D mol$bond
##D 
##D ## Print some coordinate data
##D head(mol$atom[, c("x","y","z")])
##D 
##D ## Or coordinates as a numeric vector
##D #head(mol$xyz)
##D 
##D ## Print atom charges
##D head(mol$atom[, "charge"])
##D 
##D ## Convert to PDB
##D pdb <- as.pdb(mol)
##D 
##D 
##D ## Read a multi-molecule MOL2 file
##D ## (returns a list of objects)
##D #multi.mol <- read.mol2("zinc.mol2")
##D 
##D ## Number of molecules described in file
##D #length(multi.mol)
##D 
##D ## Access ATOM records for the first molecule
##D #multi.mol[[1]]$atom
##D 
##D ## Or coordinates for the second molecule
##D #multi.mol[[2]]$xyz
##D 
##D 
##D 
##D ## Process output from docking (e.g. DOCK)
##D ## (typically one molecule with many conformations)
##D ## (returns one object, but xyz in matrix format)
##D #dock <- read.mol2("dock.mol2")
##D 
##D ## Reference PDB file (e.g. X-ray structure)
##D #pdb <- read.pdb("dock_ref.pdb")
##D 
##D ## Calculate RMSD of docking modes
##D #sele <- atom.select(dock, "noh")
##D #rmsd(pdb$xyz, dock$xyz, b.inds=sele$xyz)
## End(Not run)



