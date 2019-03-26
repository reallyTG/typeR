library(rcdk)


### Name: get.murcko.fragments
### Title: Molecule Fragmentation Methods
### Aliases: fragment get.exhaustive.fragments get.murcko.fragments
### Keywords: programming

### ** Examples

mol <- parse.smiles('c1ccc(cc1)CN(c2cc(ccc2[N+](=O)[O-])c3c(nc(nc3CC)N)N)C')[[1]]
mf1 <- get.murcko.fragments(mol, as.smiles=TRUE, single.framework=TRUE)
mf1 <- get.murcko.fragments(mol, as.smiles=TRUE, single.framework=FALSE)



