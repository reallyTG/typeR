library(TLMoments)


### Name: regionalize
### Title: Calculation of regionalized TL-moments
### Aliases: regionalize

### ** Examples

tlm <- TLMoments(
  matrix(rgev(200, loc = 10, scale = 5, shape = .3), nc = 5),
  leftrim = 0, rightrim = 1)

regionalize(tlm)
regionalize(tlm, reg.lambdas = FALSE)

parameters(regionalize(tlm), "gev")
parameters(regionalize(tlm, reg.lambdas = FALSE), "gev")

quantiles(parameters(regionalize(tlm), "gev"), c(.99, .999))
quantiles(parameters(regionalize(tlm, reg.lambdas = FALSE), "gev"), c(.99, .999))


# With magrittr
library(magrittr)
matrix(rgev(200, shape = .3), nc = 5) %>%
 TLMoments(rightrim = 1) %>%
 regionalize %>%
 parameters("gev") %>%
 quantiles(c(.99, .999))



