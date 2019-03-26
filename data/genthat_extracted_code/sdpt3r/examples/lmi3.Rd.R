library(sdpt3r)


### Name: lmi3
### Title: Linear Matrix Inequality 3
### Aliases: lmi3

### ** Examples

A <- matrix(c(-1,0,1,0,-2,1,0,0,-1),3,3)
B <- matrix(c(1,2,3,4,5,6), 2, 3)
G <- matrix(1,3,3)

out <- lmi3(A,B,G)




