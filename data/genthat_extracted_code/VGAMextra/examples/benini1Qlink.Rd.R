library(VGAMextra)


### Name: benini1Qlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions
### Aliases: benini1Qlink

### ** Examples

  ## E1. benini1Qlink() and its inverse ##
   p <- 0.50; y0 = 1.25         ## Modeling the median
   my.s <- seq(0, 5, by = 0.1)[-1]
    max(my.s - benini1Qlink(benini1Qlink(my.s, p = p, y0 = y0), 
                            p = p, y0 = y0, inverse  =TRUE))    ## Zero

  ## E2. Plot of the benini1Qlink() transformation and its inverse     ##
  ## Note, inverse = TRUE implies that argument 'theta' becomes 'eta'. ##
  ## which must be greater than log(y0). Else, value less than log(y0) ##
  ## are replaced by NaN.                                              ##
  ## No test: 
   #--- THE LINK
   my.b <- seq(0, 5, by = 0.01)[-1]
   plot(benini1Qlink(theta = my.b, p = p, y0 = y0) ~ my.b,
        type = "l", col = "blue", lty = "dotted", lwd = 3,
        xlim = c(-0.1, 6), ylim = c(-0.1, 5), las = 1,
        main = c("Blue is benini1Qlink(), green is the inverse"),
        ylab = "eta = benini1Qlink", xlab = "theta")
   abline(h = 0, v = 0, lwd = 2)
    
   #--- THE INVERSE
   lines(my.b, benini1Qlink(theta = my.b, p = p, y0 = y0, inv = TRUE),
         col = "green", lwd = 2, lty = "dashed")
   #--- Tracing the identity function for double--check
   lines(my.b, my.b)     
   
## End(No test)
    
   ## E3. WARNING! The first two values are less than log(y0)  ##
    benini1Qlink(theta = c(0.10, 0.15, 0.25, 0.35) , p = p, y0 = y0, inverse  = TRUE)
    



