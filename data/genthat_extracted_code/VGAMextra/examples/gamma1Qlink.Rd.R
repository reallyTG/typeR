library(VGAMextra)


### Name: gamma1Qlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions
### Aliases: gamma1Qlink

### ** Examples


  ## E1. gamma1QLink() and values causing NaNs or out of range  ##
  
  p <- 0.75                            # The third quartile is of interest.
  my.s <- seq(0, 5, by = 0.1)[-1]
  
  max(my.s - gamma1Qlink(gamma1Qlink(my.s, p = p), p = p, inverse  =TRUE)) ## Zero
  
  ## E2. Special values of theta ##
  gamma1Qlink(theta = c(-0.15, -0.10, 0, 1:10) , p = p, inverse  = FALSE)  ## NaNs
  gamma1Qlink(theta = c(-5, -3, 0, 1:10) , p = p, inverse  = TRUE)         ## Out of range
   
   
  ## E3. Plot of gamma1QLink() and its inverse. ##
  ## No test: 
  
    # gamma1Qlink()
    plot(gamma1Qlink(theta = my.s, p = p) ~ my.s,
         type = "l", col = "blue", lty = "dotted", lwd = 3,
         xlim = c(-0.1, 5), ylim = c(-5, 15), las = 1,
         main = c("Blue is gamma1Qlink(), green is the inverse"),
         ylab = "gamma1Qlink transformation", xlab = "theta")
     abline(h = 0, v = 0, lwd = 2)

     # The inverse
     lines(my.s, gamma1Qlink(theta = my.s, p = p, inverse = TRUE),
           col = "green", lwd = 2, lty = "dashed")
           
      # The identity function, for double-checking.
     lines(my.s, my.s, lty = "dotted")
  
## End(No test)



