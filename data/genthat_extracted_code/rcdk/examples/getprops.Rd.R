library(rcdk)


### Name: get.properties
### Title: Get All Property Values of a Molecule
### Aliases: get.properties
### Keywords: programming

### ** Examples

smiles <- 'c1ccccc1'
mol <- parse.smiles(smiles)[[1]]
set.property(mol, 'prop1', 23.45)
set.property(mol, 'prop2', 'inactive')
get.properties(mol)



