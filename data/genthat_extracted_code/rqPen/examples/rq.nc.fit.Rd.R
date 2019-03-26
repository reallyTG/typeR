library(rqPen)


### Name: rq.nc.fit
### Title: Non-convex penalized quantile regression
### Aliases: rq.nc.fit

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
scadModel <- rq.nc.fit(x,y,lambda=1)



