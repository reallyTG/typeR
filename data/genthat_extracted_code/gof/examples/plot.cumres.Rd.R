library(gof)


### Name: plot.cumres
### Title: Plot cumulative residuals from a 'cumres' object
### Aliases: plot.cumres
### Keywords: hplot regression

### ** Examples

n <- 500; x <- abs(rnorm(n,sd=0.2))+0.01; y <- sqrt(x) + rnorm(n,sd=0.2)
l <- lm(y ~ x)
g <- cumres(l, R=500)
plot(g, idx=1, ci="sim", col=NULL, col.ci="purple", legend="type2")



