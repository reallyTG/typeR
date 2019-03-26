library(Rpolyhedra)


### Name: getPolyhedron
### Title: Get polyhedron
### Aliases: getPolyhedron

### ** Examples

tetrahedron <- getPolyhedron(source = 'netlib',
       polyhedron.name = 'tetrahedron')

# returns name of polyhedra
tetrahedron$getName()

# polyhedron state
tetrahedron.state <- tetrahedron$getState()

# Johnson symbol and Schlafli symbol
tetrahedron.state$getSymbol()

# vertex data.frame
tetrahedron.state$getVertices()

# List of faces of solid representation (3D)
tetrahedron.state$getSolid()

# List of faces of net representation (2D)
tetrahedron.state$getNet()



