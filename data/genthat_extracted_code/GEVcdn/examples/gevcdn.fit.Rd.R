library(GEVcdn)


### Name: gevcdn.fit
### Title: Fit a GEV CDN model
### Aliases: gevcdn.fit

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

## Define a hierarchy of models of increasing complexity

models <- vector("list", 4)
# Stationary model
models[[1]] <- list(Th = gevcdn.identity,
                    fixed = c("location", "scale", "shape"))
# Linear model
models[[2]] <- list(Th = gevcdn.identity)
# Nonlinear, 1 hidden node
models[[3]] <- list(n.hidden = 1, Th = gevcdn.logistic)
# Nonlinear, 2 hidden nodes
models[[4]] <- list(n.hidden = 2, Th = gevcdn.logistic)

## Fit models

weights.models <- vector("list", length(models))
for(i in seq_along(models)){
    weights.models[[i]] <- gevcdn.fit(x = x, y = y, n.trials = 1,
                                      n.hidden = models[[i]]$n.hidden,
                                      Th = models[[i]]$Th,
                                      fixed = models[[i]]$fixed)
}

## Select model with minimum AICc

models.AICc <- sapply(weights.models, attr, which = "AICc")
weights.best <- weights.models[[which.min(models.AICc)]]
parms.best <- gevcdn.evaluate(x, weights.best)

## 10th, 50th, and 90th percentiles

q.best <- sapply(c(0.1, 0.5, 0.9), qgev,
                 location = parms.best[,"location"],
                 scale = parms.best[,"scale"],
                 shape = parms.best[,"shape"])

## Plot data and quantiles

matplot(x, cbind(y, q, q.best), type = c("b", rep("l", 6)),
        lty = c(1, rep(c(1, 2, 1), 2)),
        lwd = c(1, rep(c(3, 2, 3), 2)),
        col = c("red", rep("orange", 3), rep("blue", 3)),
        pch = 19, xlab = "x", ylab = "y", main = "gevcdn.fit")



