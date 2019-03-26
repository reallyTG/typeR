library(Ckmeans.1d.dp)


### Name: Univariate Clustering
### Title: Optimal and Fast Univariate Clustering
### Aliases: 'Univariate Clustering' Ckmeans.1d.dp Ckmedian.1d.dp
### Keywords: univar cluster

### ** Examples

# Ex. 1 The number of clusters is provided.
# Generate data from a Gaussian mixture model of three components
x <- c(rnorm(50, sd=0.2), rnorm(50, mean=1, sd=0.3), rnorm(100,
       mean=-1, sd=0.25))
# Divide x into 3 clusters
k <- 3

result <- Ckmedian.1d.dp(x, k)

plot(result, main="Optimal univariate k-median given k")

result <- Ckmeans.1d.dp(x, k)

plot(result, main="Optimal univariate k-means given k")

plot(x, col=result$cluster, pch=result$cluster, cex=1.5,
     main="Optimal univariate k-means clustering given k",
     sub=paste("Number of clusters given:", k))
abline(h=result$centers, col=1:k, lty="dashed", lwd=2)
legend("bottomleft", paste("Cluster", 1:k), col=1:k, pch=1:k,
       cex=1.5, bty="n")

# Ex. 2 The number of clusters is determined by Bayesian
#       information criterion
# Generate data from a Gaussian mixture model of three components
x <- c(rnorm(50, mean=-3, sd=1), rnorm(50, mean=0, sd=.5),
       rnorm(50, mean=3, sd=1))
# Divide x into k clusters, k automatically selected (default: 1~9)

result <- Ckmedian.1d.dp(x)

plot(result, main="Optimal univariate k-median with k estimated")

result <- Ckmeans.1d.dp(x)

plot(result, main="Optimal univariate k-means with k estimated")

k <- max(result$cluster)
plot(x, col=result$cluster, pch=result$cluster, cex=1.5,
     main="Optimal univariate k-means clustering with k estimated",
     sub=paste("Number of clusters is estimated to be", k))
abline(h=result$centers, col=1:k, lty="dashed", lwd=2)
legend("topleft", paste("Cluster", 1:k), col=1:k, pch=1:k,
       cex=1.5, bty="n")

# Ex. 3 Segmenting a time course using optimal weighted
#       univariate clustering
n <- 160
t <- seq(0, 2*pi*2, length=n)
n1 <- 1:(n/2)
n2 <- (max(n1)+1):n
y1 <- abs(sin(1.5*t[n1]) + 0.1*rnorm(length(n1)))
y2 <- abs(sin(0.5*t[n2]) + 0.1*rnorm(length(n2)))
y <- c(y1, y2)

w <- y^8 # stress the peaks
res <- Ckmeans.1d.dp(t, k=c(1:10), w)
plot(res)
plot(t, w, main = "Time course weighted k-means",
     col=res$cluster, pch=res$cluster,
     xlab="Time t", ylab="Transformed intensity w",
     type="h")
abline(v=res$centers, col="chocolate", lty="dashed")
text(res$centers, max(w) * .95, cex=0.5, font=2,
     paste(round(res$size / sum(res$size) * 100), "/ 100"))



