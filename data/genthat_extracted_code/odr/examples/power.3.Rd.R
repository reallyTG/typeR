library(odr)


### Name: power.3
### Title: Budget and/or sample size, power, MDES calculation for
###   three-level CRTs
### Aliases: power.3

### ** Examples

# unconstrained optimal design
  myod1 <- od.3(icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250)
  myod1$out # output  # n = 7.9, J = 3.2, p = 0.28

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.3(expr = myod1, d = 0.2, q = 1, power = 0.8)
  mym.1$out  # m = 16032, K = 97.3
  #mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.3(d = 0.2, power = 0.8, q = 1,
                 icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
                 c1 = 1, c2 = 5, c3 = 25, c1t = 1, c2t = 50, c3t = 250,
                 n = 8, J = 3, p = 0.28)
# required budget and sample size with constrained p
  mym.2 <- power.3(expr = myod1, d = 0.2, q = 1, power = 0.8,
                 constraint = list(p = 0.5))
  mym.2$out  # m = 19239, K = 78.8
# required budget and sample size with constrained p and J
  mym.3 <- power.3(expr = myod1, d = 0.2, q = 1, power = 0.8,
                 constraint = list(p = 0.5, J = 20))
  mym.3$out  # m = 39774, K = 46.9

# Power calculation
  mypower <- power.3(expr = myod1, q = 1, d = 0.2, m = 16032)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.3(expr = myod1, q = 1, d = 0.2, m = 16032,
                 constraint = list(p = 0.5))
  mypower.1$out  # power = 0.72

# MDES calculation
  mymdes <- power.3(expr = myod1, q = 1, power = 0.80, m = 16032)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size
  myK <- power.3(cost.model = FALSE, expr = myod1, d = 0.2, q = 1, power = 0.8)
  myK$out  # K = 97.3
  #myK$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myK <- power.3(cost.model = FALSE, d = 0.2, power = 0.8, q = 1,
                  icc2 = 0.2, icc3 = 0.1, r12 = 0.5, r22 = 0.5, r32 = 0.5,
                  n = 8, J = 3, p = 0.28)

# Power calculation
  mypower1 <- power.3(cost.model = FALSE, expr = myod1, K = 97, d = 0.2, q = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.3(cost.model = FALSE, expr = myod1, K = 97, power = 0.8, q = 1)
  mymdes1$out  # d = 0.20




