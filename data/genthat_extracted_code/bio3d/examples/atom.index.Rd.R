library(bio3d)


### Name: atom.index
### Title: Atom Names/Types
### Aliases: atom.index
### Keywords: datasets

### ** Examples

data(atom.index)
atom.index

# Get the atomic symbol of some atoms
atom.names <- c("CA", "O", "N", "OXT")
atom.index[match(atom.names, atom.index$name), "symb"]




