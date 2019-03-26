library(pearson7)


### Name: ppearson7
### Title: Evaluate the distribution function for the Pearson VII
###   distribution with shape parameter 3/2.
### Aliases: ppearson7

### ** Examples


curve(ppearson7(x), 0, 5, lwd = 2, ylim = c(0.8, 1), ylab = "F(x)")
curve(pnorm(x), lwd = 2, lty = 2, add = TRUE)




