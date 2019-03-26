library(VGAMextra)


### Name: toppleQlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions
### Aliases: toppleQlink

### ** Examples

  ## E1. toppleQLink() and its inverse. ##
  my.s <- ppoints(50); p <- 0.75
  max(my.s - toppleQlink(toppleQlink(my.s, p = p), p = p, inverse  =TRUE))   ## Zero
  toppleQlink(theta = c(-0.15, -0.10, 0.25, 0.35) , p = p, inverse  = FALSE) ## NaNs
  toppleQlink(theta = c(-0.15, -0.10, 0.25, 0.35) , p = p, inverse  = TRUE)  ## NaNs
   
   
  ## E2. toppleQLink() for different avlues of 'p'. ##
  ## No test: 
  plot(toppleQlink(theta = my.s, p = 0.05) ~ my.s,
       type = "l", col = "blue", lty = "dotted", lwd = 3,
       xlim = c(-0.1, 1.65), ylim = c(-0.1, 1.1), las = 1,
       main = c("The toppleQlink() transformation"),
       ylab = "eta = toppleQlink", xlab = "theta")
  abline(h = 0, v = 0, lwd = 2)
  abline(h = 1, v = 1, lty = "dotted", col = "green")
  lines(toppleQlink(theta = my.s, p = 0.25) ~ my.s, lwd = 2, lty = "dashed", col = "gray")
  lines(toppleQlink(theta = my.s, p = 0.50) ~ my.s, lwd = 2, lty = "dashed", col = "brown")
  lines(toppleQlink(theta = my.s, p = 0.75) ~ my.s, lwd = 2, lty = "dashed", col = "orange")
  lines(toppleQlink(theta = my.s, p = 0.95) ~ my.s, lwd = 2, lty = "dashed", col = "gray50")
  legend(1.1, 1.0, c("p = 0.05", "p = 0.25", "p = 0.50", "p = 0.75", "p = 0.95"),
         lwd = rep(2, 5), lty = rep("dashed", 5), 
         col = c("blue", "gray", "brown", "orange", "gray50"))
  
## End(No test)



