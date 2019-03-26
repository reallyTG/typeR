library(rqPen)


### Name: model_eval
### Title: Model Evaluation
### Aliases: model_eval

### ** Examples

x <- matrix(rnorm(800),ncol=8)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
l_model <- rq.lasso.fit(x,y,lambda=1)
nc_model <- rq.nc.fit(x,y,lambda=1)
newx <- matrix(rnorm(16),ncol=8)
newy <- 1 + newx[,1] - 3*newx[,5] + rnorm(2)
model_eval(l_model, newx, newy)
model_eval(l_model, newx, newy, func="SqErr")
model_eval(nc_model, newx, newy)



