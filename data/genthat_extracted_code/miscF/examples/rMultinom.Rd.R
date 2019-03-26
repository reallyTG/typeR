library(miscF)


### Name: rMultinom
### Title: Generate Random Samples from Different Multinomial Distributions
###   with the Same Number of Classes
### Aliases: rMultinom
### Keywords: distribution

### ** Examples

  #Example 1: Generate 100 random samples from multinomial distributions
  #           with 3 classes and different event probabilities.
  p1 <- runif(100)
  p2  <- runif(100, 0, 1-p1)
  p3 <- 1-p1-p2 
  x <- rMultinom(p=cbind(p1, p2, p3))
  



