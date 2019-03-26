library(VGAMextra)


### Name: normal1sdff
### Title: Estimation and Inference for Conditional Quantiles of a
###   1-parameter Univariate Normal Distribution.
### Aliases: normal1sdff uninormalsd

### ** Examples

   set.seed(121216)
   my.mean <- -1      #  Mean (CONSTANT)
   my.sd   <- 2.5
   y <- rnorm(100, mean = my.mean, sd = 2.0)      # Generate some data.
   normdat <- data.frame(y = y)                   # Setting up our data.
 
   ## No test: 
 
   # Plotting the data
     plot(y, main = c("Y ~ Normal ( mean(known), sd = 2.5 ). "),
          ylab = "The data", pch = 20, 
          xlim = c(0, 100), ylim = c(-7, 7), col = "blue")
     abline(h = 0, v = 0, lwd = 2, col = "black")
   
## End(No test)

   ### EXAMPLE 1. Estimate the SD with two responses. The mean is fixed. ###
   
   fit1 <- vglm(cbind(y, y) ~ 1, family = normal1sdff(fixed.mean = my.mean), 
               data = normdat, trace = TRUE, crit = "coef")
   Coef(fit1) 
   summary(fit1)
    
    
   ### EXAMPLE 2. Quantile regression. The link normal1sdQlink() is used. ###
  
   my.p <- c(25, 50, 75) / 100  # Quantiles 25%, 50% and 75% are of interest.
   
   fit2 <- vglm(Q.reg(y, length.arg = 3) ~ 1, 
                family = normal1sdff(fixed.mean = my.mean, p.quant = my.p,
                                   link = normal1sdQlink), 
                data = normdat, trace = TRUE, crit = "coef")
    summary(fit2)
    head(predict(fit2))
    constraints(fit2)


   ### EXAMPLE 3. Complete the plot. Quantiles matching. ###
   
   ## No test: 
   ( my.c3Q <- coef(fit2, matrix = TRUE) )
   with(normdat, lines(rep(my.c3Q[1], 100), col = "tan"   , lty = "dotted", lwd = 2))
   with(normdat, lines(rep(my.c3Q[2], 100), col = "orange", lty = "dotted", lwd = 2))
   with(normdat, lines(rep(my.c3Q[3], 100), col = "brown1", lty = "dotted", lwd = 2))
   legend(20, 7.0, c("Percentil 75", "Percentil 50", "Percentil 25"),
          col = c("brown1", "orange", "tan"),
          lty = rep("dotted", 3), lwd = rep(2, 3), cex = 0.75)
   
## End(No test)



