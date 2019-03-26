library(spatstat)


### Name: clarkevans.test
### Title: Clark and Evans Test
### Aliases: clarkevans.test
### Keywords: spatial nonparametric htest

### ** Examples

  # Redwood data - clustered
  clarkevans.test(redwood)
  clarkevans.test(redwood, alternative="clustered")
  clarkevans.test(redwood, correction="cdf", nsim=39)



