library(sdpt3r)


### Name: lmi2
### Title: Linear Matrix Inequality 2
### Aliases: lmi2

### ** Examples

A1 <- matrix(c(-1,0,1,0,-2,1,0,0,-1),3,3)
A2 <- A1 + 0.1*t(A1)
B  <- matrix(c(1,3,5,2,4,6),3,2)

out <- lmi2(A1,A2,B)




