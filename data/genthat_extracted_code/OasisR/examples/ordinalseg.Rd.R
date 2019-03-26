library(OasisR)


### Name: ordinalseg
### Title: A function to compute Reardon multi-group ordinal segregation
###   indices
### Aliases: ordinalseg

### ** Examples

x <- GreHSize@data[ ,3:5]
ordinalseg(x) 

x1 <- matrix(nrow = 4, ncol = 3)
x1[1,] <- c(0, 0, 30)
x1[2,] <- c(0, 20, 10)
x1[3,] <- c(10, 20 ,0)
x1[4,] <- c(30, 0 ,0)

x2 <- matrix(nrow = 4, ncol = 3)
x2[1,] <- c(0, 30, 0)
x2[2,] <- c(0, 10, 20)
x2[3,] <- c(10, 0, 20)
x2[4,] <- c(30, 0, 0)

ordinalseg(x1)
ordinalseg(x2)



