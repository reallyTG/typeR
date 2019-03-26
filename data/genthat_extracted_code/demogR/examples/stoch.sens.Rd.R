library(demogR)


### Name: stoch.sens
### Title: stoch.sens
### Aliases: stoch.sens
### Keywords: array algebra ts

### ** Examples


## Simulate an i.i.d. sequence of 3 environmental states

env <- floor(runif(100,0,3))+1
px1 <- rbeta(4,9.5,0.5)
px2 <- rbeta(4,7.5,2.5)
px3 <- rbeta(4,5,5)
mx <- c(0,rgamma(4,5,10))

A1 <- odiag(px1,-1)
A2 <- odiag(px2,-1)
A3 <- odiag(px3,-1)
A1[1,] <- leslie.row1(mx,px1)
A2[1,] <- leslie.row1(mx,px2)
A3[1,] <- leslie.row1(mx,px3)
amat <- cbind(matrix(A1,nr=25), matrix(A2,nr=25), matrix(A3,nr=25))
stoch.sens(env,amat,k=5)




