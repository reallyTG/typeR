library(clustering.sc.dp)


### Name: print.clustering.sc.dp
### Title: Print the result returned by calling clustering.sc.dp
### Aliases: print.clustering.sc.dp
### Keywords: optimize cluster ts

### ** Examples

# Example: clustering data generated from a random walk
x<-matrix(, nrow = 100, ncol = 2)
x[1,]<-c(0,0)
for(i in 2:100) {
  x[i,1]<-x[i-1,1] + rnorm(1,0,0.1)
  x[i,2]<-x[i-1,2] + rnorm(1,0,0.1)
}
result<-clustering.sc.dp(x,2)
print(result)



