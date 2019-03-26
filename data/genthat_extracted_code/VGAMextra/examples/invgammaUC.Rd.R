library(VGAMextra)


### Name: invgammaDist
### Title: The Inverse Gamma Distribution
### Aliases: invgammaDist dinvgamma pinvgamma qinvgamma rinvgamma

### ** Examples


  # Example 1.______________________
  n        <- 20
  scale    <- exp(2)
  shape    <- exp(1)
  data.1   <- runif(n, 0, 1)
  data.q   <- qinvgamma(-data.1, scale = scale, shape = shape, log.p = TRUE)  
  data.p   <- -log(pinvgamma(data.q, scale = scale, shape = shape)) 
  arg.max  <- max(abs(data.p - data.1))     # Should be zero
  
  ## No test: 
  # Example 2.______________________
  scale <- exp(1.0)
  shape <- exp(1.2)
  xx    <- seq(0, 3.0, len = 201)
  yy    <- dinvgamma(xx, scale = scale, shape = shape)
  qtl   <- seq(0.1, 0.9, by = 0.1)
  d.qtl <- qinvgamma(qtl, scale = scale, shape = shape)
  plot(xx, yy, type = "l", col = "orange", 
       main = "Orange is density, blue is cumulative distribution function",
       sub  = "Brown dashed lines represent the 10th, ... 90th percentiles",
       las = 1, xlab = "x", ylab = "", ylim = c(0, 1))
  abline(h = 0, col= "navy", lty = 2)
  lines(xx, pinvgamma(xx, scale = scale, shape = shape), col = "blue")
  lines(d.qtl, dinvgamma(d.qtl, scale = scale, shape = shape), 
        type ="h", col = "brown", lty = 3)
        
## End(No test)



