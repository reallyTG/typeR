library(spatstat)


### Name: branchlabelfun
### Title: Tree Branch Membership Labelling Function
### Aliases: branchlabelfun
### Keywords: spatial math

### ** Examples

  # make a simple tree
  m <- simplenet$m
  m[8,10] <- m[10,8] <- FALSE
  L <- linnet(vertices(simplenet), m)
  # make function
  f <- branchlabelfun(L, 1)
  plot(f)
  X <- runiflpp(5, L)
  f(X)



