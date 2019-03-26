library(ptinpoly)


### Name: blocks2vf
### Title: Convertor from 3-Block Representation Representation to
###   Vertices-Faces
### Aliases: blocks2vf
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

# Now use blocks2vf to convert back to vertices-faces representation.
# 'verts2' and 'faces2' should encode the same polyhedron as the
# original 'verts' and 'faces', although perhaps in a different order.
# Note double square brackets.
vertsFaces = blocks2vf(block1,block2,block3)
verts2 = vertsFaces[[1]]
faces2 = vertsFaces[[2]]



