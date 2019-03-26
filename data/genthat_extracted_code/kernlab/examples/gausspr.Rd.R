library(kernlab)


### Name: gausspr
### Title: Gaussian processes for regression and classification
### Aliases: gausspr gausspr,formula-method gausspr,vector-method
###   gausspr,matrix-method coef,gausspr-method show,gausspr-method
### Keywords: classif regression nonlinear methods

### ** Examples

# train model
data(iris)
test <- gausspr(Species~.,data=iris,var=2)
test
alpha(test)

# predict on the training set
predict(test,iris[,-5])
# class probabilities 
predict(test, iris[,-5], type="probabilities")

# create regression data
x <- seq(-20,20,0.1)
y <- sin(x)/x + rnorm(401,sd=0.03)

# regression with gaussian processes
foo <- gausspr(x, y)
foo

# predict and plot
ytest <- predict(foo, x)
plot(x, y, type ="l")
lines(x, ytest, col="red")


#predict and variance
x = c(-4, -3, -2, -1,  0, 0.5, 1, 2)
y = c(-2,  0,  -0.5,1,  2, 1, 0, -1)
plot(x,y)
foo2 <- gausspr(x, y, variance.model = TRUE)
xtest <- seq(-4,2,0.2)
lines(xtest, predict(foo2, xtest))
lines(xtest,
      predict(foo2, xtest)+2*predict(foo2,xtest, type="sdeviation"),
      col="red")
lines(xtest,
      predict(foo2, xtest)-2*predict(foo2,xtest, type="sdeviation"),
      col="red")




