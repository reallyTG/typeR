library(rcdk)


### Name: set.property
### Title: Set A Property On A Molecule
### Aliases: set.property
### Keywords: programming

### ** Examples

smiles <- 'c1ccccc1'
mol <- parse.smiles(smiles)[[1]]
set.property(mol, 'prop1', 23.45)
set.property(mol, 'prop2', 'inactive')
get.properties(mol)



