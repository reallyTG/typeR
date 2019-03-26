library(ShapeChange)


### Name: changept
### Title: Change-Point Estimation using Shape-Restricted Splines
### Aliases: changept
### Keywords: changept

### ** Examples

  # Example 1: the response is normal 
  # the underlying mean curve has an inflection point at .5 and it is concave-convex
  n = 100
  inflect = .5
  x = seq(1/n, 1, length = n)
  
  set.seed(123)
  y = 50 * (x - inflect)^3 + rnorm(n, sd = 1)
  ans = changept(y ~ ip(x, sh = -1))

  plot(ans)

  # Example 2: the response is binomial
  # the underlying mean curve has an inflection point at .5 and it is convex-concave
  n = 100
  x = seq(1/n, 1, length = n)
  mu = exp(8 * x - 4) / (1 + exp(8 * x - 4))

  set.seed(123)
  y = rbinom(n, size = 1, prob = mu)
  ans = changept(y ~ ip(x), family = binomial())

  plot(ans)

  # Example 3: the response is normal
  # the underlying mean curve is unimodal with a mode at .5
  n = 100
  SD = .1
  x = seq(1/n, 1, length = n)
  mode = .5

  set.seed(123)
  y = -6 * (x - .5)^2 + rnorm(n, sd = SD)
  ans = changept(y ~ tp(x))

  plot(ans)

  # Example 4: the response is binomial
  # the underlying mean curve is unimodal with a mode at .5
  n = 200
  x = seq(1/n, 1, length = n)
  mu = .9 - 2.5 * (x - .5)^2

  set.seed(123)
  y = rbinom(n, size = 1, prob = mu)
  ans = changept(y ~ tp(x), family = binomial(), k = 10, pnt = TRUE)

  plot(ans)

  # Example 5: 
  library(datasets)
  # Nile River Data Set: Nile river flow is the response
  # an abrupt downward jump in the river flow occurred around the year 1898
  # the river flow is non-decreasing on both sides of the jump point
  data(Nile)
  yrs = 1871:1970
  ans = changept(Nile ~ jp(yrs, up = FALSE, trd1 = 1, trd2 = 1), data = Nile)

  plot(ans)




