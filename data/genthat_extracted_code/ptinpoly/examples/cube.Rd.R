library(ptinpoly)


### Name: cube
### Title: Sample Data: Simple Cube
### Aliases: cube faces verts queries
### Keywords: datasets

### ** Examples

# Load sample data defining a simple cube. 
data(verts)
data(faces)

# Also load sample data for five test points.
data(queries)

# Test whether each point in 'queries' is contained in
# the simple cube defined by 'verts' and 'faces'.
# This should return "1  0  0  0 -1".
containment = pip3d(verts,faces,queries);



