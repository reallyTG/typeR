library(rcdk)


### Name: eval.desc
### Title: Evaluate a Molecular Descriptor
### Aliases: eval.desc
### Keywords: programming

### ** Examples

smiles <- c('CCC', 'c1ccccc1', 'CC(=O)C')
mols <- sapply(smiles, parse.smiles)

dnames <- get.desc.names('constitutional')
descs <- eval.desc(mols, dnames, verbose=TRUE)



