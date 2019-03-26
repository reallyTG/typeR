library(pearson7)


### Name: dpearson7
### Title: Evaluate the density for the Pearson VII distribution with shape
###   parameter 3/2.
### Aliases: dpearson7

### ** Examples


curve(dpearson7(x), -5, 5, lwd = 2, n = 500, ylab = "f(x)")
curve(dnorm(x), lwd = 2, lty = 2, n = 500, add = TRUE)




