library(Evomorph)


### Name: ShapeDist
### Title: Calculate Procrustes distance between shapes
### Aliases: ShapeDist

### ** Examples

data("aegla_landmarks")
data("aegla_consensus")

#Calculate distances between set of shapes and a reference
ShapeDist(shapes = aegla_landmarks, reference = aegla_consensus)


