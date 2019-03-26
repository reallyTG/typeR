library(bio3d)


### Name: aa.table
### Title: Table of Relevant Amino Acids
### Aliases: aa.table
### Keywords: datasets

### ** Examples

data(aa.table)
aa.table

## table look up
aa.table["HIS", ]

## read PDB, and fetch residue masses
pdb <- read.pdb(system.file("examples/1hel.pdb", package="bio3d"))
aa2mass(pdb)



