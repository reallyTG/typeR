library(shapes)


### Name: testmeanshapes
### Title: Tests for mean shape difference, including permutation and
###   bootstrap tests
### Aliases: testmeanshapes
### Keywords: multivariate

### ** Examples


#2D example : female and male Gorillas

data(gorf.dat)
data(gorm.dat)

A<-gorf.dat
B<-gorm.dat
testmeanshapes(A,B,resamples=100)




