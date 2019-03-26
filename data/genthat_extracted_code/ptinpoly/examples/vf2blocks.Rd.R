library(ptinpoly)


### Name: vf2blocks
### Title: Convertor from Vertices-Faces Representation to 3-Block
###   Representation
### Aliases: vf2blocks
### Keywords: methods

### ** Examples

# Load example data.
data(verts)
data(faces)

# Use vf2blocks to convert from vertices-faces representation to 3-block representation.
# Note double square brackets.
blocks = vf2blocks(verts,faces)
block1 = blocks[[1]]
block2 = blocks[[2]]
block3 = blocks[[3]]



