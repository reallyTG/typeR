library(ShapeChange)


### Name: ip
### Title: Specify an Inflection-Point Category in a CHANGEPT Formula
### Aliases: ip
### Keywords: symbolic routine

### ** Examples

  # the underlying mean curve is a non-decreasing growth curve 
  # with an inflection point at .5 and it is convex-concave
  n = 100
  x = seq(1/n, 1, length = n)

  set.seed(123)
  y = 5 * (1 + tanh(10 * (x - .5)))  + rnorm(n, sd = 1)
  ans = changept(y ~ ip(x, sh = 1), fir = TRUE)

  plot(ans)



