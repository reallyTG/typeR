library(fossil)


### Name: tri.ineq
### Title: Testing for the Triangle Inequality
### Aliases: tri.ineq

### ** Examples

## sample distance matrix with an impossible triangle
a<-matrix(0.2, 4,4)
a[4,2]<-0.8
a<-as.dist(a)
tri.ineq(a)



