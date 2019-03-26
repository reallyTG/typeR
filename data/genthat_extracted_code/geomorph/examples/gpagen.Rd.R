library(geomorph)


### Name: gpagen
### Title: Generalized Procrustes analysis of points, curves, and surfaces
### Aliases: gpagen
### Keywords: analysis

### ** Examples

# Example 1: fixed points only
data(plethodon) 
Y.gpa <- gpagen(plethodon$land,PrinAxes=FALSE)
summary(Y.gpa)
plot(Y.gpa)

# Example 2: points and semilandmarks on curves
data(hummingbirds)

###Slider matrix
hummingbirds$curvepts

# Using Procrustes Distance for sliding
Y.gpa <- gpagen(hummingbirds$land,curves=hummingbirds$curvepts)   
summary(Y.gpa)
plot(Y.gpa)

# Using bending energy for sliding
Y.gpa <- gpagen(hummingbirds$land,curves=hummingbirds$curvepts,ProcD=FALSE)   
summary(Y.gpa)
plot(Y.gpa)

# Example 3: points, curves and surfaces
data(scallops)

# Using Procrustes Distance for sliding
Y.gpa <- gpagen(A=scallops$coorddata, curves=scallops$curvslide, surfaces=scallops$surfslide)
# NOTE can summarize as: summary(Y.gpa)
# NOTE can plot as: plot(Y.gpa) 



