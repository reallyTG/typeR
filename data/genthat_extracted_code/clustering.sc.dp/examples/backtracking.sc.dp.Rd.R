library(clustering.sc.dp)


### Name: backtracking.sc.dp
### Title: Backtracking Clustering for a Specific Cluster Number
### Aliases: backtracking.sc.dp
### Keywords: optimize cluster ts

### ** Examples

# Example: clustering data generated from a random walk with small withinss
x<-matrix(, nrow = 100, ncol = 2)
x[1,]<-c(0,0)
for(i in 2:100) {
  x[i,1]<-x[i-1,1] + rnorm(1,0,0.1)
  x[i,2]<-x[i-1,2] + rnorm(1,0,0.1)
}
k<-10
r<-findwithinss.sc.dp(x,k)

# select the first cluster number where withinss drops below a threshold
thres <- 5.0
k_th <- 1;
while(r$twithinss[k_th] > thres & k_th < k) {
    k_th <- k_th + 1
}

# backtrack
result<-backtracking.sc.dp(x,k_th, r$backtrack)
plot(x, type = 'b', col = result$cluster)
points(result$centers, pch = 24, bg = (1:k_th))



