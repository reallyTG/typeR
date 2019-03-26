library(bayesSurv)


### Name: credible.region
### Title: Compute a simultaneous credible region (rectangle) from a sample
###   for a vector valued parameter.
### Aliases: credible.region
### Keywords: htest

### ** Examples

  m <- 10000
  sample <- data.frame(x1=rnorm(m), x2=rnorm(m), x3=rnorm(m))
  probs <- c(0.70, 0.90, 0.95)
  CR <- credible.region(sample, probs=probs)

  for (kk in 1:length(CR)){
    suma <- sum(sample$x1 >= CR[[kk]]["Lower", "x1"] & sample$x1 <= CR[[kk]]["Upper", "x1"] &
            sample$x2 >= CR[[kk]]["Lower", "x2"] & sample$x2 <= CR[[kk]]["Upper", "x2"] &
            sample$x3 >= CR[[kk]]["Lower", "x3"] & sample$x3 <= CR[[kk]]["Upper", "x3"])
    show <- c(suma/m, probs[kk])
    names(show) <- c("Empirical", "Desired")
    print(show)
  }



