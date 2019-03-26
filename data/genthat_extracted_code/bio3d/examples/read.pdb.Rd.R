library(bio3d)


### Name: read.pdb
### Title: Read PDB File
### Aliases: read.pdb read.pdb2 print.pdb summary.pdb
### Keywords: IO

### ** Examples

## Read a PDB file from the RCSB online database
#pdb <- read.pdb("4q21")

## Read a PDB file from those included with the package
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Print a brief composition summary
pdb

## Examine the storage format (or internal *str*ucture)
str(pdb)

## Print data for the first four atom
pdb$atom[1:4,]

## Print some coordinate data
head(pdb$atom[, c("x","y","z")])

## Or coordinates as a numeric vector
#head(pdb$xyz)

## Print C-alpha coordinates (can also use 'atom.select' function)
head(pdb$atom[pdb$calpha, c("resid","elety","x","y","z")])
inds <- atom.select(pdb, elety="CA")
head( pdb$atom[inds$atom, ] )

## The atom.select() function returns 'indices' (row numbers)
## that can be used for accessing subsets of PDB objects, e.g.
inds <- atom.select(pdb,"ligand")
pdb$atom[inds$atom,]
pdb$xyz[inds$xyz]

## See the help page for atom.select() function for more details.


## Not run: 
##D ## Print SSE data for helix and sheet,
##D ##  see also dssp() and stride() functions
##D print.sse(pdb)
##D pdb$helix
##D pdb$sheet$start
##D   
##D ## Print SEQRES data
##D pdb$seqres
##D 
##D ## SEQRES as one letter code
##D aa321(pdb$seqres)
##D 
##D ## Where is the P-loop motif in the ATOM sequence
##D inds.seq <- motif.find("G....GKT", pdbseq(pdb))
##D pdbseq(pdb)[inds.seq]
##D 
##D ## Where is it in the structure
##D inds.pdb <- atom.select(pdb,resno=inds.seq, elety="CA")
##D pdb$atom[inds.pdb$atom,]
##D pdb$xyz[inds.pdb$xyz]
##D 
##D ## View in interactive 3D mode
##D #view(pdb)
## End(Not run)




