library(predkmeans)


### Name: predictionMetrics
### Title: Measures of Prediction Performance
### Aliases: predictionMetrics

### ** Examples

n <- 100
d <- 5 # Dimension of exposure
K <- 3 # Number of clusters
X <- matrix(rnorm(n*d), ncol=d, nrow=n)
centers <- matrix(runif(d*K), nrow=K, ncol=d)
cluster_pred <- sample(1:K, size=n, replace=TRUE)
metrics <- predictionMetrics(centers, cluster.pred=cluster_pred, X=X)
metrics[c("MSPE", "wSS", "MSME", "pred.acc")]



