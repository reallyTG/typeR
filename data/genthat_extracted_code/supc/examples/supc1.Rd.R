library(supc)


### Name: supc1
### Title: Self-Updating Process Clustering
### Aliases: supc1

### ** Examples

## Not run: 
##D set.seed(1)
##D X <- local({
##D  mu <- list(
##D    x = c(0, 2, 1, 6, 8, 7, 3, 5, 4),
##D    y = c(0, 0, 1, 0, 0, 1, 3, 3, 4)
##D  )
##D  X <- lapply(1:5, function(i) {
##D    cbind(rnorm(9, mu$x, 1/5), rnorm(9, mu$y, 1/5))
##D  })
##D  X <- do.call(rbind, X)
##D  n <- nrow(X)
##D  X <- rbind(X, matrix(0, 20, 2))
##D  k <- 1
##D  while(k <= 20) {
##D    tmp <- c(13*runif(1)-2.5, 8*runif(1)-2.5)
##D    y1 <- mu$x - tmp[1]
##D    y2 <- mu$y - tmp[2]
##D    y <- sqrt(y1^2+y2^2)
##D    if (min(y)> 2){
##D      X[k+n,] <- tmp
##D      k <- k+1
##D    }
##D  }
##D  X
##D })
##D X.supcs <- supc1(X, r = c(0.9, 1.7, 2.5), t = "dynamic")
##D X.supcs$cluster
##D plot(X.supcs[[1]], type = "heatmap", major.size = 2)
##D plot(X.supcs[[2]], type = "heatmap", col = cm.colors(24), major.size = 5)
##D 
##D X.supcs <- supc1(X, r = c(1.7, 2.5), t = list(
##D  function(t) {1.7 / 20 + exp(t) * (1.7 / 50)},
##D  function(t) {exp(t)}
##D ))
##D plot(X.supcs[[1]], type = "heatmap", major.size = 2)
##D plot(X.supcs[[2]], type = "heatmap", col = cm.colors(24), major.size = 5)
## End(Not run)




