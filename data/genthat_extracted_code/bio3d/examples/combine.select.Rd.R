library(bio3d)


### Name: combine.select
### Title: Combine Atom Selections From PDB Structure
### Aliases: combine.select
### Keywords: utilities

### ** Examples


# Read a PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## - Build atom selections to be operated
# Select C-alpha atoms of entire system
ca.global.inds <- atom.select(pdb, "calpha")

# Select C-beta atoms of entire protein
cb.global.inds <- atom.select(pdb, "protein", elety="CB")

# Select backbone atoms of entire system
bb.global.inds <- atom.select(pdb, "backbone")

# Select all atoms with residue number from 46 to 50
aa.local.inds <- atom.select(pdb, resno=46:50)


# Do set intersect:
# - Return C-alpha atoms with residue number from 46 to 50
ca.local.inds <- combine.select(ca.global.inds, aa.local.inds)
print( pdb$atom[ ca.local.inds$atom, ] )

# Do set subtract:
# - Return side-chain atoms with residue number from 46 to 50
sc.local.inds <- combine.select(aa.local.inds, bb.global.inds, operator="-")
print( pdb$atom[ sc.local.inds$atom, ] )

# Do set union:
# - Return C-alpha and side-chain atoms with residue number from 46 to 50
casc.local.inds <- combine.select(ca.local.inds, sc.local.inds, operator="+")
print( pdb$atom[ casc.local.inds$atom, ] )

# More than two selections:
# - Return side-chain atoms (but not C-beta) with residue number from 46 to 50
sc2.local.inds <- combine.select(aa.local.inds, bb.global.inds, cb.global.inds, operator="-")
print( pdb$atom[ sc2.local.inds$atom, ] )




