library(clustering.sc.dp)


### Name: clustering.sc.dp
### Title: Optimal Clustering Multidimensional Data with Sequential
###   Constraint by Dynamic Programming
### Aliases: clustering.sc.dp
### Keywords: optimize cluster ts

### ** Examples

# Example: clustering data generated from a random walk
x<-matrix(, nrow = 100, ncol = 2)
x[1,]<-c(0,0)
for(i in 2:100) {
  x[i,1]<-x[i-1,1] + rnorm(1,0,0.1)
  x[i,2]<-x[i-1,2] + rnorm(1,0,0.1)
}
k<-2
result<-clustering.sc.dp(x,k)
plot(x, type = 'b', col = result$cluster)
points(result$centers, pch = 24, bg = (1:k))



