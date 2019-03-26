library(flam)


### Name: flam
### Title: Fit the Fused Lasso Additive Model for a Sequence of Tuning
###   Parameters
### Aliases: flam

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 10, noise = 1)

#fit model for a range of lambda chosen by default and alpha's of 0.75 and 1
flam.out <- flam(x = data$x, y = data$y, alpha.seq = c(0.75, 1))
#or specify desired lambda sequence (often equally spaced on log scale)
#should be a decreasing sequence of several values for computational speed
user.lambda.seq <- exp(seq(log(50), log(1), len=40))
flam.out2 <- flam(x = data$x, y = data$y, lambda.seq = user.lambda.seq)

## Not run: 
##D #alternatively, generate data for logistic FLAM model
##D data2 <- sim.data(n = 50, scenario = 1, zerof = 10, family = "binomial")
##D #fit the FLAM model using logistic loss
##D flam.logistic.out <- flam(x = data2$x, y = data2$y, family = "binomial")
## End(Not run)

#'flam' returns an object of the class 'flam'
#see ?'flam-package' for an example using S3 methods for 'flam' objects




