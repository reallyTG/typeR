library(geomorph)


### Name: mshape
### Title: Estimate mean shape for a set of aligned specimens
### Aliases: mshape
### Keywords: utilities

### ** Examples

data(plethodon)
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment

mshape(Y.gpa$coords)   #mean (consensus) configuration



