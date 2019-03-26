library(bio3d)


### Name: atom.select
### Title: Atom Selection from PDB and PRMTOP Structure Objects
### Aliases: atom.select atom.select.pdb atom.select.mol2
###   atom.select.prmtop print.select
### Keywords: utilities

### ** Examples


##- PDB example
# Read a PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

# Select protein atoms of chain A
atom.select(pdb, "protein", chain="A")

# Select all atoms except from the protein
atom.select(pdb, "protein", inverse=TRUE, verbose=TRUE)

# Select all C-alpha atoms with residues numbers between 43 and 54
sele <- atom.select(pdb, "calpha", resno=43:54, verbose=TRUE)

# Access the PDB data with the selection indices
print( pdb$atom[ sele$atom, "resid" ] )
print( pdb$xyz[ sele$xyz ] )

# Trim PDB to selection
ca.pdb <- trim.pdb(pdb, sele)

## Not run: 
##D 
##D ##- PRMTOP example
##D prmtop <- read.prmtop(system.file("examples/crambin.prmtop", package="bio3d"))
##D 
##D ## Atom selection
##D ca.inds <- atom.select(prmtop, "calpha")
##D 
## End(Not run)



