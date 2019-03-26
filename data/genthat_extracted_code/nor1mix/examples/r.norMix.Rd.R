library(nor1mix)


### Name: r.norMix
### Title: Ratio of Normal Mixture to Corresponding Normal
### Aliases: r.norMix
### Keywords: distribution

### ** Examples

  d3 <- norMix(m = 5*(0:2), w = c(0.6, 0.3, 0.1))
  plot(d3)
  rd3 <- r.norMix(d3)
  str(rd3)
  stopifnot(rd3 $ y  == r.norMix(d3, xy.ret = FALSE))
  par(new = TRUE)
  plot(rd3, type = "l", col = 3, axes = FALSE, xlab = "", ylab="")
  axis(4, col.axis=3)



