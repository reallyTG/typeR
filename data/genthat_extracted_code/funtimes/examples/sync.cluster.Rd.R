library(funtimes)


### Name: sync.cluster
### Title: Time Series Clustering based on Trend Synchronism
### Aliases: sync.cluster
### Keywords: cluster synchrony trend

### ** Examples

## Not run: 
##D ## Simulate 4 autoregressive time series, 
##D ## 3 having a linear trend and 1 without a trend:
##D set.seed(123)
##D T = 100 #length of time series
##D N = 4 #number of time series
##D X = sapply(1:N, function(x) arima.sim(n = T, 
##D            list(order = c(1, 0, 0), ar = c(0.6))))
##D X[,1] <- 5 * (1:T)/T + X[,1]
##D plot.ts(X)
##D 
##D # Finding clusters with common linear trends:
##D LinTrend <- sync.cluster(X ~ t) 
##D   
##D ## Sample Output:
##D ##[1] "Cluster labels:"
##D ##[1] 0 1 1 1
##D ##[1] "Number of single-element clusters (labeled with '0'): 1"
##D 
##D ## plotting the time series of the cluster obtained
##D for(i in 1:max(LinTrend$cluster)) {
##D     plot.ts(X[, LinTrend$cluster == i], 
##D             main = paste("Cluster", i))
##D }
##D 
##D 
##D ## Simulating 7 autoregressive time series, 
##D ## where first 4 time series have a linear trend added 
##D set.seed(234)
##D T = 100 #length of time series
##D a <- sapply(1:4, function(x) -10 + 0.1 * (1:T) + 
##D             arima.sim(n = T, list(order = c(1, 0, 0), ar = c(0.6))))
##D b <- sapply(1:3, function(x) arima.sim(n = T, 
##D             list(order = c(1, 0, 0), ar = c(0.6))))
##D Y <- cbind(a, b)
##D plot.ts(Y)
##D 
##D ## Clustering based on linear trend with rate of removal = 2 
##D # and confidence level for the synchronism test 90%
##D LinTrend7 <- sync.cluster(Y ~ t, rate = 2, alpha = 0.1, B = 99)
##D    
##D ## Sample output:
##D ##[1] "Cluster labels:"
##D ##[1] 1 1 1 0 2 0 2
##D ##[1] "Number of single-element clusters (labeled with '0'): 2"
## End(Not run)




