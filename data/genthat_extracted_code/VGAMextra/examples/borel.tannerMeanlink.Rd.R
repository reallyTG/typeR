library(VGAMextra)


### Name: borel.tannerMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Borel-Tanner distribution.
### Aliases: borel.tannerMeanlink

### ** Examples


## Example 1. Special values for theta (or eta, accordingly)  ##
a.par <- c(0, 1:10/10, 20, 1e1, Inf, -Inf, NaN, NA) 

# The borel.tannerMeanlink transformation and the first two derivatives.
print(rbind(a.par, 
 deriv1 = borel.tannerMeanlink(theta = a.par, inverse = FALSE, deriv = 1),
 deriv2 = borel.tannerMeanlink(theta = a.par, inverse = FALSE, deriv = 2)),
 digits = 2)
  
# The inverse of 'borel.tannerMeanlink()' and the first two derivatives.
# 'theta' turns into 'eta'.
print(rbind(a.par, 
    Invderiv1 = borel.tannerMeanlink(theta = a.par, inverse = TRUE, deriv = 1),
    Invderiv2 = borel.tannerMeanlink(theta = a.par, inverse = TRUE, deriv = 2)),
    digits = 2)

  
## Example 2 ##
a.param <- c(0, 1, 5, 10, 1e2, 1e3) 
rbind(a.values = a.param, 
      inv.BT = borel.tannerMeanlink(theta = a.param, inverse = TRUE))
    
data.inv <- borel.tannerMeanlink(borel.tannerMeanlink(a.param, inv = TRUE)) - a.param
summary(data.inv)                      ## Should be zero



## Example 3. Some link functions in VGAM with domain set (0, 1) ##
a.param <- ppoints(100)
## No test: 
par(lwd = 2)
plot(a.param, borel.tannerMeanlink(a.param), ylim = c(-5, 7), xlim = c(-0.01, 1.01),
     type = "l", col = "gray10", ylab = "transformation",
     las = 1, main = "Some probability link functions")
lines(s.shapes, logffMeanlink(a.param), col = "blue")
lines(s.shapes, logit(a.param), col = "limegreen")
lines(s.shapes, probit(a.param), col = "purple")
lines(s.shapes, cloglog(a.param), col = "chocolate")
lines(s.shapes, cauchit(a.param), col = "tan")
abline(v = c(0.5, 1), lty = "dashed")
abline(v = 0, h = 0, lty = "dashed")
legend(0.05, 7, c("borel.tanneMeanlink", "logffMeanlink", "logit", "probit",
                  "cloglog", "cauchit"),
       col = c("gray10", "blue", "limegreen", "purple", "chocolate", "tan"),
      lwd = 1)
par(lwd = 1) 
## End(No test)



