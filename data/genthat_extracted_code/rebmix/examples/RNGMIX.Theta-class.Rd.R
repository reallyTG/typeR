library(rebmix)


### Name: RNGMIX.Theta-class
### Title: Class '"RNGMIX.Theta"'
### Aliases: RNGMIX.Theta-class RNGMVNORM.Theta-class
###   show,RNGMIX.Theta-method show,RNGMVNORM.Theta-method
### Keywords: classes

### ** Examples

Theta <- new("RNGMIX.Theta", c = 2, pdf = c("normal", "Weibull"))  

a.theta1(Theta, l = 1) <- c(2, 10)
a.theta2(Theta, l = 1) <- c(0.5, 2.3)
a.theta1(Theta, l = 2) <- c(20, 50)
a.theta2(Theta, l = 2) <- c(3, 4.2)

Theta

Theta <- new("RNGMVNORM.Theta", c = 2, d = 3)

a.theta1(Theta, l = 1) <- c(2, 10, -20)
a.theta1(Theta, l = 2) <- c(-2.4, -15.1, 30)

Theta



