library(VGAMextra)


### Name: expQlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions.
### Aliases: expQlink

### ** Examples

 ## E1. expQlink() and its inverse ##
    p <- 0.25            # Modelling the first quartile.
    my.theta <- seq(0, 5, by = 0.1)[-1]
    my.diff <- my.theta - expQlink(expQlink(my.theta, p = p), p = p, inverse  =TRUE)
    summary(my.diff)     # Zero


  ## E2. Special values ##
    expQlink(theta = c(Inf, -Inf, NA, NaN), p = p)
    
## No test: 
  ##  E3. Plot of expQlink() for different quantiles  ##
    plot(expQlink(my.theta, p = p) ~ my.theta, 
         type = "l", lty = "dotted", col = "blue", lwd = 2,
         main = "expQink(p) transformation", xlab = "theta", ylab = "expQLink",
         xlim = c(-0.5, 5), ylim = c(-0.5, 5))
    abline(h = 0, v = 0, lwd = 2)
    lines(my.theta, expQlink(my.theta, p = 0.50),  col = "green", lty = "dotted", lwd = 2)
    lines(my.theta, expQlink(my.theta, p = 0.75),  col = "red", lty = "dotted", lwd = 2)
    legend(2, 4,  c("p = 0.25", "p = 0.50", "p = 0.75"), col = c("blue", "green", "red"),
           lwd = c(2, 2, 2), lty = c("dotted", "dotted", "dotted"))
  
## End(No test)



