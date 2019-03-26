library(VGAMextra)


### Name: logffMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Logarithmic Distribuion.
### Aliases: logffMeanlink logfflink.inv.deriv0

### ** Examples


## Example 1  ##
set.seed(0906)
Shapes <- sort(runif(10)) 
logffMeanlink(theta = Shapes, deriv = 1)    ## d eta/d theta, as function of theta

logldata.inv <-
       logffMeanlink(theta = logffMeanlink(theta = Shapes), inverse = TRUE) - Shapes
                      
summary(logldata.inv)                   ## Should be zero


## Example 2 Some probability link funtions ##
s.shapes <- ppoints(100)
## No test: 
par(lwd = 2)
plot(s.shapes, logit(s.shapes), xlim = c(-0.1, 1.1), type = "l", col = "limegreen", 
     ylab = "transformation", las = 1, main = "Some probability link functions")
lines(s.shapes, logffMeanlink(s.shapes), col = "blue")
lines(s.shapes, probit(s.shapes), col = "purple")
lines(s.shapes, cloglog(s.shapes), col = "chocolate")
lines(s.shapes, cauchit(s.shapes), col = "tan")
abline(v = c(0.5, 1), lty = "dashed")
abline(v = 0, h = 0, lty = "dashed")
legend(0.1, 4.5, c("logffMeanlink","logit", "probit", "cloglog", "cauchit"),
       col = c("blue", "limegreen", "purple", "chocolate", "tan"), lwd = 1)
par(lwd = 1) 
## End(No test)

## Example 3. Plot of 'logffMeanlink()' with eta = 1.5.  ##
m.eta1.5 <- logffMeanlink(theta = s.shapes, deriv = 0) - 1.5
## No test: 
 plot(m.eta1.5 ~ s.shapes, type = "l", col = "limegreen", 
      las = 1, lty = 2, lwd = 3, xlim = c(-0.1, 1.0), ylim = c(-2, 3),
      xlab = "shape parameter, s, in (0, 1).", 
      ylab = "logffMeanlink(s) - 1.5",
      main = "logff.func(s; 1.5) = logffMeanlink(s) - 1.5, in (0, 1)")
 abline(h = 0, v = 0)
 abline(v = 1.0, lty = 2)
 
## End(No test)

## Example 4. Special values of theta, inverse = FALSE ##
s.shapes <- c(-Inf, -2, -1, 0.0, 0.25, 0.5, 1, 10, 100, Inf, NaN, NA) 
rbind(s.shapes, logffMeanlink(theta = s.shapes))



