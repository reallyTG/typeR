library(geomorph)


### Name: two.b.pls
### Title: Two-block partial least squares analysis for Procrustes shape
###   variables
### Aliases: two.b.pls
### Keywords: analysis

### ** Examples

data(plethShapeFood) 
Y.gpa<-gpagen(plethShapeFood$land)    #GPA-alignment    

#2B-PLS between head shape and food use data
PLS <-two.b.pls(Y.gpa$coords,plethShapeFood$food,iter=999)
summary(PLS)
plot(PLS)



