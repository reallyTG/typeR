library(rcdk)


### Name: parse.smiles
### Title: Parse a Vector of SMILES Strings
### Aliases: parse.smiles
### Keywords: programming

### ** Examples

smiles <- c('CCC', 'c1ccccc1', 'C(C)(C=O)C(CCNC)C1CC1C(=O)')
mol <- parse.smiles(smiles[1])
mols <- parse.smiles(smiles)



