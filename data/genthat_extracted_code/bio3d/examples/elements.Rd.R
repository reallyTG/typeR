library(bio3d)


### Name: elements
### Title: Periodic Table of the Elements
### Aliases: elements
### Keywords: datasets

### ** Examples

data(elements)
elements

# Get the mass of some elements
symb <- c("C","O","H")
elements[match(symb,elements[,"symb"]),"mass"]

# Get the van der Waals radii of some elements
symb <- c("C","O","H")
elements[match(symb,elements[,"symb"]),"rvdw"]




