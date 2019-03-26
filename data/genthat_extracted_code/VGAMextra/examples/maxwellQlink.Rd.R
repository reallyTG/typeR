library(VGAMextra)


### Name: maxwellQlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions
### Aliases: maxwellQlink

### ** Examples

  ## E1. maxwellQlink() and its inverse ##
   p <- 0.25        ## Modeling the first quartile
   my.a <- seq(0, 5, by = 0.1)[-1]
   max(my.a - maxwellQlink(maxwellQlink(my.a, p = p), p = p, inverse  =TRUE)) ## Zero
    
  ## E2. The first two values are negative, NaN is returned ##
    maxwellQlink(theta = c(-0.15, -0.10, 0.25, 0.35) , p = p, inverse  = FALSE)
    maxwellQlink(theta = c(-0.15, -0.10, 0.25, 0.35) , p = p, inverse  = TRUE)

  ## E3. Plot of the maxwellQlink() and its inverse                    ##
  ## Note, inverse = TRUE implies that argument 'theta' becomes 'eta'. ##
   
  ## No test: 
   #--- THE LINK
   
   plot(maxwellQlink(theta = my.a, p = p) ~ my.a,
        type = "l", col = "blue", lty = "dotted", lwd = 3,
        xlim = c(-0.1, 10), ylim = c(-0.1, 5), las = 1,
        main = c("Blue is maxwellQlink(), green is the inverse"),
        ylab = "eta = maxwellQlink", xlab = "theta")
   abline(h = 0, v = 0, lwd = 2)
    
   #--- THE INVERSE
   lines(my.a, maxwellQlink(theta = my.a, p = p,inv = TRUE), 
          col = "green", lwd = 2, lty = "dashed")
   lines(my.a, my.a)     # Tracing the identity function for double--check
   
## End(No test)
    



