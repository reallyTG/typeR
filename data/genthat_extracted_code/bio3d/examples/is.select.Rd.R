library(bio3d)


### Name: is.select
### Title: Is an Object of Class 'select'?
### Aliases: is.select
### Keywords: classes

### ** Examples

# Read a PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

# Print structure summary
atom.select(pdb)

# Select all C-alpha atoms with residues numbers between 43 and 54
ca.inds <- atom.select(pdb, "calpha", resno=43:54)
is.select(ca.inds)




