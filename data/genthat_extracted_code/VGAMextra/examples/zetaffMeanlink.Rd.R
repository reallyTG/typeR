library(VGAMextra)


### Name: zetaffMeanlink
### Title: Link functions for the mean of 1-parameter discrete
###   distributions: The Zeta Distribution.
### Aliases: zetaffMeanlink zetafflink.inv.deriv0

### ** Examples


## Example 1  ##
Shapes <- 1:10 + 0.1 
zetaffMeanlink(theta = Shapes, deriv = 1)  ## d eta/d theta, as function of theta

zetafflk.inv <-
 zetaffMeanlink(theta = zetaffMeanlink(theta = Shapes), inverse = TRUE) - Shapes
 
summary(zetafflk.inv)                      ## Should be zero


## Example 2. Special values of theta, inverse = FALSE ##
Shapes <- c(-Inf, -1, 0.5, 1, 1.5, 10, 100, Inf, NaN, NA) 
print(rbind(Shapes, zetaffMeanlink  = zetaffMeanlink(theta = Shapes),
            inv.zfflink = zetaffMeanlink(theta = Shapes, inverse = TRUE)), digits = 3)


## Example 3. Plot of 'zetaffMeanlink()' and its first two derivatives ##
## inverse = FALSE, deriv = 0, 1, 2 ##
## No test: 
Shapes <- seq(1, 20, by = 0.01)[-1]
y.shapes <- zetaffMeanlink(theta = Shapes, deriv = 0)
der.1 <- zetaffMeanlink(theta = Shapes, deriv = 1)
der.2 <- zetaffMeanlink(theta = Shapes, deriv = 2)

plot(y.shapes ~ Shapes, 
     col = "black", main = "log(mu), mu = E[Y], Y ~ Zeta(s).",
     ylim = c(-5, 10), xlim = c(-0.1, 5), lty = 1, type = "l", lwd = 3)
abline(v = 1.0, col = "orange", lty = 2, lwd = 3)
abline(v = 0, h = 0, col = "gray50", lty = "dashed")

lines(Shapes, der.1, col = "blue", lty = 5)
lines(Shapes, der.2, col = "chocolate", lty = 4)
legend(2, 7, legend = c("zetaffMeanlink", "deriv = 1", "deriv = 2"),
       col = c("black", "blue", "chocolate"), lty = c(1, 5, 4), lwd = c(3, 1, 1))
 
## End(No test)




