library(geomorph)


### Name: arrayspecs
### Title: Convert landmark data matrix into array (p x k x n)
### Aliases: arrayspecs
### Keywords: utilities

### ** Examples

x<-matrix(rnorm(18),nrow=3)  # Random triangles (all coordinates on same row for each triangle)
arrayspecs(x,3,2) 
 
x2<-matrix(rnorm(18),ncol=2) # Random triangles (each landmark on its own row)
arrayspecs(x2,3,2)



