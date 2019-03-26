library(shapes)


### Name: transformations
### Title: Calculate similarity transformations
### Aliases: transformations
### Keywords: multivariate

### ** Examples


#2D example : female and male Gorillas (cf. Dryden and Mardia, 2016)

data(gorf.dat)

Xorig <- gorf.dat
Xrotated <- procGPA(gorf.dat)$rotated

transformations(Xrotated,Xorig)




