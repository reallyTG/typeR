library(rcdk)


### Name: is.connected
### Title: Get the Largest Component in a Disconnected Molecule
### Aliases: get.largest.component is.connected
### Keywords: programming

### ** Examples

m <- parse.smiles("CC.CCCCCC.CCCC")[[1]]
largest <- get.largest.component(m)
length(get.atoms(largest)) == 6



