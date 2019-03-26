library(rv)


### Name: cc
### Title: Combine values in an rv object
### Aliases: cc c.rv c.rvsummary
### Keywords: classes

### ** Examples


  x <- rvnorm(2)
  y <- rvbern(2, prob=0.5)
  z <- c(x, y)
  print(z)
  z1 <- cc(1, z)
  z2 <- c(as.rv(1), z)
  z3 <- c(as.rv(1), z)
  print(z1)
  print(z2)
  print(z3)




