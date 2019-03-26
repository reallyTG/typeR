library(ptinpoly)


### Name: pip3d
### Title: Test for Point Containment in 3D Polyhedron
### Aliases: pip3d
### Keywords: methods

### ** Examples

#-------------------------------------------
# Simple Cube example.

# Load sample data defining a simple cube. 
data(verts)
data(faces)

# Also load sample data for five test points.
data(queries)

# Test whether each point in 'queries' is contained in
# the simple cube defined by 'verts' and 'faces'.
# This should return "1  0  0  0 -1".
containment <- pip3d(verts,faces,queries);

#-------------------------------------------
# Torus example.

# Make a donut-shaped polyhedron.
torus <- parametric3d(fx = function(u,v) (1+0.25*cos(v))*cos(u),
                      fy = function(u,v) (1+0.25*cos(v))*sin(u),
                      fz = function(u,v) 0.25*sin(v),
                      u = seq(0,2*pi,length.out=10),
                      v = seq(0,2*pi,length.out=10),
                      engine = "none", color="orange", alpha=0.25)

# If desired, this torus can be rendered for visualization, e.g.:
# library(geometry)
# library(rgl)
# drawScene.rgl(torus)

# Convert the torus to vertices-faces representation.
ve       <- misc3d:::t2ve(torus)
Vertices <- t(ve$vb)
Faces    <- t(ve$ib)

# Generate 3333 random test points.
set.seed(1902)
n       <- 3333
x1      <- rnorm(n) ; x2 <- rnorm(n) ; x3 <- rnorm(n)
X       <- cbind(x1,x2,x3)
Queries <- as.matrix(X)

# Check whether test points are contained in the torus.
# Most of these points will lie outside the torus.
containment <- pip3d(Vertices,Faces,Queries);

#-------------------------------------------
# If you remove one of the faces of the cube, the resulting cube
# becomes "leaky".  Running 'pip3d' on the resulting defective
# polyhedron will return -2.
# NOT RUN
#
# badcube     <- faces[1:11,]
# containment <- pip3d(verts,badcube,queries);



