library(mritc)


### Name: rnormmix
### Title: Generate Random Samples from a Normal Mixture Model
### Aliases: rnormmix
### Keywords: distribution

### ** Examples

  prop <- c(.17, .48, .35)
  mu <- c(-4, 0, 4)
  sigma <- rep(1, 3)
  y <- rnormmix(n=10000, prop, mu, sigma)
  densityplot(~ y[,1], groups = y[,2],
              plot.points = FALSE, ref = TRUE,
              xlab="sample values",
              auto.key = list(columns = 3))



