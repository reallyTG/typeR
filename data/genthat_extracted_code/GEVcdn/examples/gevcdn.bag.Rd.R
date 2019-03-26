library(GEVcdn)


### Name: gevcdn.bag
### Title: Fit an ensemble of GEV CDN models via bagging
### Aliases: gevcdn.bag

### ** Examples

## Generate synthetic data, quantiles

x <- as.matrix(seq(0.1, 1, length = 50))

loc <- x^2
scl <- x/2
shp <- seq(-0.1, 0.3, length = length(x))

set.seed(100)
y <- as.matrix(rgev(length(x), location = loc, scale = scl,
               shape = shp))
q <- sapply(c(0.1, 0.5, 0.9), qgev, location = loc, scale = scl,
            shape = shp)

## Not run: 
##D ## Fit ensemble of models with early stopping turned on
##D 
##D weights.on <- gevcdn.bag(x = x, y = y, iter.max = 100,
##D                          iter.step = 10, n.bootstrap = 10,
##D                          n.hidden = 2)
##D 
##D parms.on <- lapply(weights.on, gevcdn.evaluate, x = x)
##D 
##D ## 10th, 50th, and 90th percentiles
##D 
##D q.10.on <- q.50.on <- q.90.on <- matrix(NA, ncol=length(parms.on),
##D                                         nrow=nrow(x))
##D for(i in seq_along(parms.on)){
##D     q.10.on[,i] <- qgev(p = 0.1,
##D                         location = parms.on[[i]][,"location"],
##D                         scale = parms.on[[i]][,"scale"],
##D                         shape = parms.on[[i]][,"shape"])
##D     q.50.on[,i] <- qgev(p = 0.5,
##D                         location = parms.on[[i]][,"location"],
##D                         scale = parms.on[[i]][,"scale"],
##D                         shape = parms.on[[i]][,"shape"])
##D     q.90.on[,i] <- qgev(p = 0.9,
##D                         location = parms.on[[i]][,"location"],
##D                         scale = parms.on[[i]][,"scale"],
##D                         shape = parms.on[[i]][,"shape"])
##D }
##D 
##D ## Plot data and quantiles
##D 
##D matplot(cbind(y, q, rowMeans(q.10.on), rowMeans(q.50.on),
##D         rowMeans(q.90.on)), type = c("b", rep("l", 6)),
##D         lty = c(1, rep(c(1, 2, 1), 2)),
##D         lwd = c(1, rep(c(3, 2, 3), 2)),
##D         col = c("red", rep("orange", 3), rep("blue", 3)),
##D         pch = 19, xlab = "x", ylab = "y",
##D         main = "gevcdn.bag (early stopping on)")
## End(Not run)



