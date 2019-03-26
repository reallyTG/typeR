library(emstreeR)


### Name: ComputeMST
### Title: Euclidean Minimum Spanning Tree
### Aliases: ComputeMST

### ** Examples


## artifical data
set.seed(1984)
n <- 15
c1 <- data.frame(x = rnorm(n,-0.2, sd=0.2), y = rnorm(n,-2,sd=0.2))
c2 <- data.frame(x = rnorm(n,-1.1, sd=0.15), y = rnorm(n,-2,sd=0.3)) 
d <- rbind(c1, c2)
d <- as.data.frame(d)

## MST:
out <- ComputeMST(d)
out




