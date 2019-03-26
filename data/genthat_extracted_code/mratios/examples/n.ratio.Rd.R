library(mratios)


### Name: n.ratio
### Title: Sample size computation in simultaneous tests for ratios of
###   means
### Aliases: n.ratio
### Keywords: htest

### ** Examples



  #
  #  Example 1: Sample size calculation in tests for non-inferiority
  #  (two-sample case)(Laster and Johnson (2003),
  #  Statistics in Medicine 22:187-200)

     n.ratio(m=1, rho=0.8, Power=0.8, CV0=0.75, rho.star=1,
     alpha=0.05)


  #
  #  Example 2: Sample size calculation in simultaneous tests for
  #  non-inferiority
  #  (Dilba et al. (2006), Statistics in Medicine 25:1131-1147)

     n.ratio(m=3, rho=0.7, Power=0.8, CV0=0.5, rho.star=0.95,
     alpha=0.05)


  #
  #  Example 3: Controlling complete power
  #

     n.ratio(m=5, rho=1.2, Power=0.8, CV0=0.2, rho.star=1.40,
         alpha=0.05, Min.power=FALSE)




