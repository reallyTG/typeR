library(VGAMextra)


### Name: geometricffMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Geometric Distribution.
### Aliases: geometricffMeanlink

### ** Examples


### Example 1  ###
my.probs <- ppoints(100)
geol.inv <-
    geometricffMeanlink(theta = geometricffMeanlink(theta = my.probs), # the inverse
                                inverse = TRUE) - my.probs
summary(geol.inv)     ## zero

###  Example 2. Special values of 'prob'  ###
my.probs <- c(-Inf, -2, -1, 0, 0.25, 0.75, 1.0, 5, Inf, NaN, NA) 
rbind(probs = my.probs, 
      geoffMlink = geometricffMeanlink(theta = my.probs),
      inv.geoffl = geometricffMeanlink(theta = my.probs, inverse = TRUE))


###  Example 3 Some probability link functions  ###
## No test: 
my.probs <- ppoints(100)

par(lwd = 2)
plot(my.probs, logit(my.probs), xlim = c(-0.1, 1.1), ylim = c(-5, 8),
     type = "l", col = "limegreen", 
     ylab = "transformation", las = 1, main = "Some probability link functions")
lines(my.probs, geometricffMeanlink(my.probs), col = "gray50")
lines(my.probs, logffMeanlink(my.probs), col = "blue")
lines(my.probs, probit(my.probs), col = "purple")
lines(my.probs, cloglog(my.probs), col = "chocolate")
lines(my.probs, cauchit(my.probs), col = "tan")
abline(v = c(0.5, 1), lty = "dashed")
abline(v = 0, h = 0, lty = "dashed")
legend(0.1, 8, 
      c("geometricffMeanlink", "logffMeanlink","logit", "probit", "cloglog", "cauchit"), 
      col = c("gray50", "blue", "limegreen", "purple", "chocolate", "tan"), lwd = 1, cex = 0.5)
par(lwd = 1) 
 
## End(No test)



