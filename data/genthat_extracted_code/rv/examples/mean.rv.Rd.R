library(rv)


### Name: mean.rv
### Title: Distribution of the Arithmetic Mean of a Random Vector
### Aliases: mean.rv
### Keywords: classes

### ** Examples


  y <- rvnorm(10, mean=0, sd=1)
  m1 <- mean(y)
  m2 <- rvnorm(1, mean=0, sd=1/sqrt(10))
  print(c(m1, m2)) # should have the same distribution




