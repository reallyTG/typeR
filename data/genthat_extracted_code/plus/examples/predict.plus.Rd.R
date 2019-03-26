library(plus)


### Name: predict.plus
### Title: Extract coefficients and make predictions from a plus solution
###   path.
### Aliases: predict.plus coef.plus
### Keywords: methods

### ** Examples

data(sp500)
attach(sp500)

x <- sp500.percent[,3: (dim(sp500.percent)[2])] 
y <- sp500.percent[,1]

object <- plus(x,y,method="mc+")
## extract coefficients for the first 10 values of lam.path at values in x  
extracted.values <- predict(object, lam = sort(object$lam.path[1:10],decreasing=TRUE), newx=object$x)
extracted.coef <- coef(object, lam = sort(object$lam.path[1:10],decreasing=TRUE))
detach(sp500)



