library(rcdk)


### Name: get.mol2formula
### Title: Parser a molecule to formula object.
### Aliases: get.mol2formula
### Keywords: programming

### ** Examples

molecule <- parse.smiles("N")[[1]]
convert.implicit.to.explicit(molecule)
formula <- get.mol2formula(molecule,charge=0)



