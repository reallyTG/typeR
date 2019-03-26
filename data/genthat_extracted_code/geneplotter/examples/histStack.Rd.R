library(geneplotter)


### Name: histStack
### Title: Stacked histogram
### Aliases: histStack
### Keywords: hplot

### ** Examples

  x    <- list(rnorm(42), rnorm(42)+2)
  br   <- seq(-3, 5, length=13)
  cols <- c("#1D267B", "#ceffc0")
  histStack(x, breaks=br, col=cols)

  histStack(x, breaks=br, col=cols,
            breaksFun=function(z) paste(signif(z, 3)))



