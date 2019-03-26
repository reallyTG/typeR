library(VGAMextra)


### Name: inv.chisqDist
### Title: The Inverse Chi-squared Distribution
### Aliases: inv.chisqDist dinv.chisq pinv.chisq qinv.chisq rinv.chisq

### ** Examples


  ##  Example 1  ## 
  nn <- 50; df <- 1.4
  data.1   <- ppoints(nn)
  data.q   <- qinv.chisq(-data.1, df = df, log.p = TRUE)  
  data.p   <- -log(pinv.chisq(data.q, df = df)) 
  max(abs(data.p - data.1))     # Should be zero
  
  ## No test: 
  ##  Example 2  ##

  xx    <- seq(0, 3.0, len = 301)
  yy    <- dinv.chisq(xx, df = df)
  qtl   <- seq(0.1, 0.9, by = 0.1)
  d.qtl <- qinv.chisq(qtl, df = df)
  plot(xx, yy, type = "l", col = "orange", 
       main = "Orange is density, blue is cumulative distribution function",
       sub  = "Brown dashed lines represent the 10th, ... 90th percentiles",
       las = 1, xlab = "x", ylab = "", ylim = c(0, 1))
  abline(h = 0, col= "navy", lty = 2)
  lines(xx, pinv.chisq(xx, df = df), col = "blue")
  lines(d.qtl, dinv.chisq(d.qtl, df = df), type ="h", col = "brown", lty = 3)
  
## End(No test)



