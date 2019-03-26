library(rcdk)


### Name: get.property
### Title: Get the Value of a Molecule Property
### Aliases: get.property get.title
### Keywords: programming

### ** Examples

smiles <- 'c1ccccc1'
mol <- parse.smiles(smiles)[[1]]
set.property(mol, 'prop1', 23.45)
set.property(mol, 'prop2', 'inactive')
get.property(mol, 'prop1')



