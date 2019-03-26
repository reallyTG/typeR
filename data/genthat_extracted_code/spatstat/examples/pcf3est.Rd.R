library(spatstat)


### Name: pcf3est
### Title: Pair Correlation Function of a Three-Dimensional Point Pattern
### Aliases: pcf3est
### Keywords: spatial nonparametric

### ** Examples

  X <- rpoispp3(250)
  Z <- pcf3est(X)
  Zbias <- pcf3est(X, biascorrect=FALSE)
  if(interactive()) {
    opa <- par(mfrow=c(1,2))
    plot(Z,     ylim.covers=c(0, 1.2))
    plot(Zbias, ylim.covers=c(0, 1.2))
    par(opa)
  }
  attr(Z, "delta")



