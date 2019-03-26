library(VGAMextra)


### Name: yulesimonMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Yule-Simon Distribution.
### Aliases: yulesimonMeanlink

### ** Examples


## Example 1  ##
Shapes <- 1:10 
yulesimonMeanlink(theta = Shapes, deriv = 1)  ## d eta/d theta, as function of theta

yulesl.inv <-
        yulesimonMeanlink(theta = yulesimonMeanlink(theta = Shapes),  # the inverse
                               inverse = TRUE) - Shapes
                      
summary(yulesl.inv)     ## zero


## Example 2. Special values of theta (rho) ##
rhos <- c(-Inf, -2, -1, 0.0, 0.5, 1, 5, 10, 100, Inf, NaN, NA) 
rbind(rho = rhos, 
      yuleslink  = yulesimonMeanlink(theta = rhos),
      inv.yulesl =yulesimonMeanlink(theta = rhos, inverse = TRUE))


## Example 3 The yulesimonMeanlink transformation and the first two derivatives ##
## No test: 
rhos <- seq(1, 20, by = 0.01)[-1]
y.rhos <- yulesimonMeanlink(theta = rhos, deriv = 0)
der.1  <- yulesimonMeanlink(theta = rhos, deriv = 1)
der.2  <- yulesimonMeanlink(theta = rhos, deriv = 2)

plot(y.rhos ~ rhos, col = "black", 
     main = "log(mu), mu = E[Y], Y ~ Yule-Simon(rho).",
     ylim = c(-5, 10), xlim = c(-1, 5), lty = 1, type = "l", lwd = 3)
abline(v = 1.0, col = "orange", lty = 2, lwd = 3)
abline(v = 0, h = 0, col = "gray50", lty = "dashed")

lines(rhos, der.1, col = "blue", lty = 5)
lines(rhos, der.2, col = "chocolate", lty = 4)
legend(2, 7, legend = c("yulesimonMeanlink", "deriv = 1", "deriv = 2"),
       col = c("black", "blue", "chocolate"), lty = c(1, 5, 4))
 
## End(No test)



