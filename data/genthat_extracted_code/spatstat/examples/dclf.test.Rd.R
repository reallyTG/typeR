library(spatstat)


### Name: dclf.test
### Title: Diggle-Cressie-Loosmore-Ford and Maximum Absolute Deviation
###   Tests
### Aliases: dclf.test mad.test
### Keywords: spatial htest

### ** Examples

  dclf.test(cells, Lest, nsim=39)
  m <- mad.test(cells, Lest, verbose=FALSE, rinterval=c(0, 0.1), nsim=19)
  m
  # extract the p-value
  m$p.value
  # variance stabilised G function
  dclf.test(cells, Gest, transform=expression(asin(sqrt(.))),
                   verbose=FALSE, nsim=19)

  ## one-sided test
  ml <- mad.test(cells, Lest, verbose=FALSE, nsim=19, alternative="less")

  ## scaled
  mad.test(cells, Kest, verbose=FALSE, nsim=19,
           rinterval=c(0.05, 0.2),
           scale=function(r) { r })



