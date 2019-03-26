library(arm)


### Name: rescale
### Title: Function for Standardizing by Centering and Dividing by 2 sd's
### Aliases: rescale
### Keywords: manip

### ** Examples

  # Set up the fake data
  n <- 100
  x <- rnorm (n, 2, 1)
  x1 <- rnorm (n)
  x1 <- (x1-mean(x1))/(2*sd(x1))   # standardization
  x2 <- rbinom (n, 1, .5)
  b0 <- 1
  b1 <- 1.5
  b2 <- 2
  y <- rbinom (n, 1, invlogit(b0+b1*x1+b2*x2))
  rescale(x, "full")
  rescale(y, "center")



