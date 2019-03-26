library(rcdk)


### Name: smiles.flavors
### Title: Generate flag for customizing SMILES generation.
### Aliases: smiles.flavors

### ** Examples

m <- parse.smiles('C1C=CCC1N(C)c1ccccc1')[[1]]
get.smiles(m)
get.smiles(m, smiles.flavors(c('Generic','UseAromaticSymbols')))

m <- parse.smiles("OS(=O)(=O)c1ccc(cc1)C(CC)CC |Sg:n:13:m:ht,Sg:n:11:n:ht|")[[1]]
get.smiles(m,flavor = smiles.flavors(c("CxSmiles")))
get.smiles(m,flavor = smiles.flavors(c("CxSmiles","UseAromaticSymbols")))




