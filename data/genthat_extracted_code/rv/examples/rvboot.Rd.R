library(rv)


### Name: rvboot
### Title: Generate a Random Vector from an Empirical Distribution
### Aliases: rvboot
### Keywords: classes

### ** Examples


  y <- rnorm(30) # Some data: 30 draws from standard normal.
  x <- rvboot(y) # A random vector of length 30 (each component has the same distribution)
  print(mean(x)) # Bootstrap estimate of the mean.
  print(sd.rv(x))   # Bootstrap estimate of the sd.
  # rvinci(mean(x), 0) # Hypothesis test: mean of x is zero (at 5% level) FALSE => reject.




