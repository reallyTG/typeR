library(longclust)


### Name: print.longclust
### Title: Brief overview of the longclust object
### Aliases: print.longclust

### ** Examples

library(mvtnorm)
m1 <- c(23,34,39,45,51,56)
S1 <- matrix(c(1.00, -0.90, 0.18, -0.13, 0.10, -0.05, -0.90, 
1.31, -0.26, 0.18, -0.15, 0.07, 0.18, -0.26, 4.05, -2.84, 
2.27, -1.13, -0.13, 0.18, -2.84, 2.29, -1.83, 0.91, 0.10, 
-0.15, 2.27, -1.83, 3.46, -1.73, -0.05, 0.07, -1.13, 0.91, 
-1.73, 1.57), 6, 6)
m2 <- c(16,18,15,17,21,17)
S2 <- matrix(c(1.00, 0.00, -0.50, -0.20, -0.20, 0.19, 0.00, 2.00, 
0.00, -1.20, -0.80, -0.36,-0.50, 0.00, 1.25, 0.10, -0.10, -0.39, 
-0.20, -1.20, 0.10, 2.76, 0.52, -1.22,-0.20, -0.80, -0.10, 0.52, 
1.40, 0.17, 0.19, -0.36, -0.39, -1.22, 0.17, 3.17), 6, 6)
m3 <- c(8, 11, 16, 22, 25, 28)
S3 <- matrix(c(1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 
-0.20, -0.64, 0.26, 0.00, 0.00, -0.20, 1.04, -0.17, -0.10, 0.00, 
0.00, -0.64, -0.17, 1.50, -0.65, 0.00, 0.00, 0.26, -0.10, -0.65, 
1.32, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00), 6, 6)
m4 <- c(12, 9, 8, 5, 4 ,2)
S4 <- diag(c(1,1,1,1,1,1))
data <- matrix(0, 40, 6)
data[1:10,] <- rmvnorm(10, m1, S1)
data[11:20,] <- rmvnorm(10, m2, S2)
data[21:30,] <- rmvnorm(10, m3, S3)
data[31:40,] <- rmvnorm(10, m4, S4)
clus <- longclustEM(data, 3, 5, linearMeans=TRUE)
print(clus)

## The function is currently defined as
function (tch, ...) 
{
    cat("Number of Clusters:", tch$Gbest, "\n")
    cat("z:\n")
    print(tch$zbest)
    cat("\n")
    for (g in 1:tch$Gbest) {
        cat("Cluster: ", g, "\n")
        cat("v: ", tch$nubest[g], "\n")
        cat("mean:", tch$mubest[g, ], "\n\n")
    }
  }



