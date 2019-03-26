library(bio3d)


### Name: get.pdb
### Title: Download PDB Coordinate Files
### Aliases: get.pdb
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

## PDB file paths
get.pdb( c("1poo", "1moo"), URLonly=TRUE )

## These URLs can be used by 'read.pdb'
pdb <- read.pdb( get.pdb("5p21", URL=TRUE) )
summary(pdb)

## Download PDB file
## get.pdb("5p21")
## End(No test)



