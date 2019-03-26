library(odr)


### Name: power.4
### Title: Budget and/or sample size, power, MDES calculation for
###   four-level CRTs
### Aliases: power.4

### ** Examples

# unconstrained optimal design
  myod1 <- od.4(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
              c1 = 1, c2 = 5, c3 = 25, c4 = 125,
              c1t = 1, c2t = 50, c3t = 250, c4t = 2500)
  myod1$out # output # n = 7.1, J = 3.2, K = 4.2, p = 0.23

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.4(expr = myod1, d = 0.2, q = 1, power = 0.8)
  mym.1$out  # m = 71161, L = 57.1
  #mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.4(d = 0.2, power = 0.8, q = 1,
                 icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
                 r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
                 c1 = 1, c2 = 5, c3 = 25, c4 = 125,
                 c1t = 1, c2t = 50, c3t = 250, c4t = 2500,
                 n = 7, J = 3, K = 4, p = 0.23)
# required budget and sample size with constrained p (p = 0.5)
  mym.2 <- power.4(expr = myod1, d = 0.2, q = 1, power = 0.8,
                 constraint = list(p = 0.5))
  mym.2$out  # m = 93508, L = 41.1
# required budget and sample size with constrained p and K
  mym.3 <- power.4(expr = myod1, d = 0.2, q = 1, power = 0.8,
                 constraint = list(p = 0.5, K = 20))
  mym.3$out  # m = 157365, L = 25.7

# Power calculation
  mypower <- power.4(expr = myod1, q = 1, d = 0.2, m = 71161)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.4(expr = myod1, q = 1, d = 0.2, m = 71161,
                 constraint = list(p = 0.5))
  mypower.1$out  # power = 0.68

# MDES calculation
  mymdes <- power.4(expr = myod1, q = 1, power = 0.80, m = 71161)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size
  myL <- power.4(cost.model = FALSE, expr = myod1, d = 0.2, q = 1, power = 0.8)
  myL$out  # L = 57.1
#myL$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myL <- power.4(cost.model = FALSE, d = 0.2, power = 0.8, q = 1,
                  icc2 = 0.2, icc3 = 0.1, icc4 = 0.05,
                  r12 = 0.5, r22 = 0.5, r32 = 0.5, r42 = 0.5,
                  n = 7, J = 3, K = 4, p = 0.23)

# Power calculation
  mypower1 <- power.4(cost.model = FALSE, expr = myod1, L = 57, d = 0.2, q = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.4(cost.model = FALSE, expr = myod1, L = 57, power = 0.8, q = 1)
  mymdes1$out  # d = 0.20




