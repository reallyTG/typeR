library(spatstat)


### Name: quadrat.test.mppm
### Title: Chi-Squared Test for Multiple Point Process Model Based on
###   Quadrat Counts
### Aliases: quadrat.test.mppm
### Keywords: spatial htest

### ** Examples

  H <- hyperframe(X=waterstriders)
  # Poisson with constant intensity for all patterns
  fit1 <- mppm(X~1, H)
  quadrat.test(fit1, nx=2)

  # uniform Poisson with different intensity for each pattern
  fit2 <- mppm(X ~ id, H)
  quadrat.test(fit2, nx=2)



