library(Rvcg)


### Name: checkFaceOrientation
### Title: check the orientation of a mesh
### Aliases: checkFaceOrientation

### ** Examples

data(dummyhead)
## now we invert faces inwards
checkFaceOrientation(dummyhead.mesh)
dummyinward <- Morpho::invertFaces(dummyhead.mesh)
checkFaceOrientation(dummyinward)



