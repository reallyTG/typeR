library(extremefit)


### Name: wquantile
### Title: Weighted quantile
### Aliases: wquantile

### ** Examples


X <- rpareto(10)
p <- seq(0.01, 0.99, 0.01)
plot(p, wquantile(X, p, rep(1,length(X))), type = "s")




