library(VGAMextra)


### Name: posPoiMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Positive Poisson Distribution.
### Aliases: posPoiMeanlink pospoilink.inv.deriv0

### ** Examples


## Example 1. Special values for theta (or eta, accordingly)  ##
m.lambda <- c(0, 0.5, 1, 10, 20, 25, 1e2, 1e3, Inf, -Inf, NaN, NA) 

# The 'posPoiMeanlink' transformation and the first two derivatives.
print(rbind(m.lambda, 
  deriv1 = posPoiMeanlink(theta = m.lambda, inverse = FALSE, deriv = 1),
  deriv2 = posPoiMeanlink(theta = m.lambda, inverse = FALSE, deriv = 2)),
  digits = 2)
  
# The inverse of 'posPoiMeanlink' and the first two derivatives.
print(rbind(m.lambda, 
  Invderiv1 = posPoiMeanlink(theta = m.lambda, inverse = TRUE, deriv = 1),
  Invderiv2 = posPoiMeanlink(theta = m.lambda, inverse = TRUE, deriv = 2)),
  digits = 2)
  

## Example 2. The inverse of 'posPoiMeanlink' ##
m.lambda <- c(0, 1, 5, 10, 1e2, 1e3) 
posPoiMeanlink(theta = posPoiMeanlink(m.lambda, inverse = TRUE))
pospoi.inv <- posPoiMeanlink(posPoiMeanlink(m.lambda, inverse = TRUE)) - m.lambda
                           
summary(pospoi.inv)                      ## Should be zero.


## Example 3. Plot of 'posPoiMeanlink' and its first two derivatives ##
## inverse = FALSE, deriv = 0, 1, 2. ##
## No test: 
m.lambda <- seq(0, 35, by = 0.01)[-1]
y.lambda <- posPoiMeanlink(theta = m.lambda, deriv = 0)
der.1 <- posPoiMeanlink(theta = m.lambda, deriv = 1)
der.2 <- posPoiMeanlink(theta = m.lambda, deriv = 2)

plot(y.lambda ~ m.lambda, col = "black", 
     main = "log(mu), mu = E[Y], Y ~ pospoisson(lambda).",
     ylim = c(-1, 10), xlim = c(-1, 26),
     lty = 1, type = "l", lwd = 3)
abline(v = 0, h = 0, col = "gray50", lty = "dashed")

lines(m.lambda, der.1, col = "blue", lty = 5, lwd = 3)
lines(m.lambda, der.2, col = "chocolate", lty = 4, lwd = 3)
legend(5, 9, legend = c("posPoiMeanlink", "deriv = 1", "deriv = 2"),
       col = c("black", "blue", "chocolate"), lty = c(1, 5, 4), lwd = c(3, 3, 3))
 
## End(No test)



