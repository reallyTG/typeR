library(sdpt3r)


### Name: sqlp
### Title: Semidefinite Quadratic Linear Programming Solver
### Aliases: sqlp

### ** Examples


blk = c("l" = 2)
C = matrix(c(1,1),nrow=1)
A = matrix(c(1,3,4,-1), nrow=2)
At = t(A)
b = c(12,10)
out = sqlp(blk,list(At),list(C),b)




