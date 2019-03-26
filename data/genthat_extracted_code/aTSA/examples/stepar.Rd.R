library(aTSA)


### Name: stepar
### Title: Stepwise Autoregressive Model
### Aliases: stepar

### ** Examples

x <- 5*(1:100)/100
x <- x + arima.sim(list(order = c(1,0,0),ar = 0.4),n = 100)
stepar(x)
stepar(x,order = 1)

# with xreg supplied
X <- matrix(rnorm(200),100,2)
y <- 0.1*X[,1] + 1.2*X[,2] + rnorm(100)
stepar(y,X)
# make a prediction with lead = 1; used with caution.
newdat1 <- matrix(rnorm(2),nrow = 1)
fit1 <- stepar(y,X,lead = 1,newx = newdat1,output = FALSE)
# make a prediction with lead = 2; used with caution.
newdat2 <- matrix(rnorm(4),nrow = 2)
fit2 <- stepar(y,X,lead = 2,newx = newdat2,output = FALSE)



