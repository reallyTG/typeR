library(VGAMextra)


### Name: genbetaIIDist
### Title: The Generalized Beta Distribution of the Second King
### Aliases: genbetaIIDist dgen.betaII pgen.betaII qgen.betaII rgen.betaII

### ** Examples


  # Setting parameters to both examples below.
  b  <- exp(0.4)      # Scale parameter.
  a  <- exp(0.5)      # Shape1.a
  p  <- exp(0.3)      # Shape2.p
  q  <- exp(1.4)      # Shape3.q
  
  # (1) ______________  
  probs.y <- seq(0.0, 1.0, by = 0.01)
  data.1  <- qgen.betaII(p = probs.y, scale = b, shape1.a = a, 
                        shape2.p = p, shape3.q = q)
  max(abs(pgen.betaII(q = data.1, scale = b, shape1.a = a, 
                     shape2.p = p, shape3.q = q)) - probs.y) # Should be 0.
 ## No test: 
  # (2)_________________
  xx    <- seq(0, 10.0, length = 200)
  yy    <- dgen.betaII(xx, scale = b, shape1.a = a, shape2.p = p, shape3.q = q)
  qtl   <- seq(0.1, 0.9, by = 0.1)
  d.qtl <- qgen.betaII(qtl, scale = b, shape1.a = a, shape2.p = p, shape3.q = q)
  plot(xx, yy, type = "l", col = "red", 
       main = "Red is the GB2 density, blue is the GB2 Distribution Function",
       sub  = "Brown dashed lines represent the 10th, ..., 90th percentiles",
       las = 1, xlab = "x", ylab = "", xlim = c(0, 3), ylim = c(0,1))
  abline(h = 0, col = "navy", lty = 2)
  abline(h = 1, col = "navy", lty = 2)
  lines(xx, pgen.betaII(xx, scale = b, shape1.a = a, 
                       shape2.p = b, shape3.q = q), col= "blue")
  lines(d.qtl, dgen.betaII(d.qtl, scale = b, shape1.a = a, 
                        shape2.p = p, shape3.q = q), 
                        type ="h", col = "brown", lty = 3)
 
## End(No test)



