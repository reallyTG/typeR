library(flam)


### Name: predict.flam
### Title: Predicts Observations for a New Covariate Matrix and Fit from
###   'flam'
### Aliases: predict.flam

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 100, scenario = 1, zerof = 0, noise = 1)

#fit model for a range of tuning parameters
flam.out <- flam(x = data$x, y = data$y)

#we can make predictions for a covariate matrix with new observations
#choose desired alpha and lambda
alpha <- flam.out$all.alpha[15]; lambda <- flam.out$all.lambda[15]
#new.x with 20 observations and the same number of features as flam.out$x
new.data <- sim.data(n = 20, scenario = 1, zerof = 0, noise = 1)
new.x <- new.data$x
#make predictions
y.hat <- predict(flam.out, new.x = new.x, lambda = lambda, alpha = alpha)
#which can be compared to the true y
plot(new.data$y, y.hat, xlab="y", ylab=expression(hat(y)))
abline(0,1,lty=2)

#can also make predictions for any alpha and lambda:
predict(flam.out, new.x = new.x, lambda = 2, alpha = 0.9)



