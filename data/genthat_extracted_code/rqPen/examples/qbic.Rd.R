library(rqPen)


### Name: qbic
### Title: Quantile Regresion BIC
### Aliases: qbic

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
l_model <- rq.lasso.fit(x,y, lambda=1)
nc_model <- rq.nc.fit(x,y, lambda=1)
qbic(l_model)
qbic(nc_model)
qbic(l_model, largeP=TRUE)
qbic(nc_model, largeP=TRUE)



