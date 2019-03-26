library(OasisR)


### Name: rankorderseg
### Title: A function to compute rank-ordered segregation indices
### Aliases: rankorderseg

### ** Examples

x1 <- matrix(nrow = 4, ncol = 7)
x1[1,] <- c( 10,  10, 10, 20, 30, 40, 50)
x1[2,] <- c( 0, 20, 10, 10, 10, 20, 20)
x1[3,] <- c(10, 20,  10, 10, 10, 0, 0 )
x1[4,] <- c(30, 30,  20, 10, 10, 0, 0 )
x2 <- x1
x2[,c(3,4,6,7)] <- x1[,c(6,7,3,4)]

rankorderseg(x1)
rankorderseg(x2, pred = seq(0, 1, 0.1))




