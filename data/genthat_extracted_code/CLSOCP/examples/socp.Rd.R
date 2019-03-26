library(CLSOCP)


### Name: socp
### Title: Solve Second Order Cone Programs
### Aliases: socp prob soln
### Keywords: optimization SOCP CLSOCP

### ** Examples


#Load an example SOCP
data(prob)

#Solve the socp
soln <- socp(prob$A, prob$b, prob$c, dim(prob$A)[2])





