library(rcdk)


### Name: get.smiles
### Title: Get the SMILES for a Molecule
### Aliases: get.smiles
### Keywords: programming

### ** Examples

m <- parse.smiles('C1C=CCC1N(C)c1ccccc1')[[1]]
get.smiles(m)
get.smiles(m, smiles.flavors(c('Generic','UseAromaticSymbols')))



