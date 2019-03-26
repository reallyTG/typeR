library(VGAMextra)


### Name: invweibullDist
### Title: The Inverse Weibull Distribution
### Aliases: invweibullDist dinvweibull pinvweibull qinvweibull rinvweibull

### ** Examples

  #(1) ______________
  n        <- 20
  scale    <- exp(2)
  shape    <- exp(1)
  data.1   <- runif(n, 0, 1)
  data.q   <- qinvweibull(-data.1, scale = scale, shape = shape, log.p = TRUE)  
  data.p   <- -log(pinvweibull(data.q, scale = scale, shape = shape)) 
  arg.max  <- max(abs(data.p - data.1))     # Should be zero
  
## No test: 
  #(2)_________________
   scale  <- exp(1.0)
    shape <- exp(1.2)
    xx    <- seq(0, 10.0, len = 201)
    yy    <- dinvweibull(xx, scale = scale, shape = shape)
    qtl   <- seq(0.1, 0.9, by =0.1)
    d.qtl <- qinvweibull(qtl, scale = scale, shape = shape)
    plot(xx, yy, type = "l", col = "red", 
         main = "Red is density, blue is cumulative distribution function",
         sub  = "Brown dashed lines represent the 10th, ... 90th percentiles",
         las = 1, xlab = "x", ylab = "", ylim = c(0,1))
    abline(h = 0, col= "navy", lty = 2)
    lines(xx, pinvweibull(xx, scale = scale, shape = shape), col= "blue")
    lines(d.qtl, dinvweibull(d.qtl, scale = scale, shape = shape), 
          type ="h", col = "brown", lty = 3)
        
## End(No test)



