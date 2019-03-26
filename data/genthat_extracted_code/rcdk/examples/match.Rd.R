library(rcdk)


### Name: matches
### Title: Perform Substructure Searching & MCS Detection
### Aliases: match matches smarts substructure is.subgraph get.mcs mcs
### Keywords: programming

### ** Examples

smiles <- c('CCC', 'c1ccccc1', 'C(C)(C=O)C(CCNC)C1CC1C(=O)')
mols <- sapply(smiles, parse.smiles)
query <- '[#6]=O'
doesMatch <- matches(query, mols)

## get mappings
mappings <- matches("CCC", mols, TRUE)



