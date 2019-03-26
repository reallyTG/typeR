library(odr)


### Name: power.3m
### Title: Budget and/or sample size, power, MDES calculation for
###   three-level multisite randomized trials
### Aliases: power.3m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.3m(icc2 = 0.2, icc3 = 0.1, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32m = 0.5,
              c1 = 1, c2 = 5,
              c1t = 1, c2t = 200, c3 = 200,
              varlim = c(0, 0.005))
  myod1$out # n = 13, J = 15, p = 0.23

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.3m(expr = myod1, d = 0.2, q2 = 1, q3 = 1, power = 0.8)
  mym.1$out  # m = 13177, K = 11.5
  # mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.3m(d = 0.2, power = 0.8, q2 = 1, q3 = 1,
                 icc2 = 0.2, icc3 = 0.1, omega = 0.02,
                  r12 = 0.5, r22 = 0.5, r32m = 0.5,
                  c1 = 1, c2 = 5,
                  c1t = 1, c2t = 200, c3 = 200,
                  n = 13, J = 15, p = 0.23)
# required budget and sample size with constrained p
  mym.2 <- power.3m(expr = myod1, d = 0.2, q2 = 1, q3 = 1, power = 0.8,
                 constraint = list(p = 0.5))
  mym.2$out  # m = 17026, K = 8.8
# required budget and sample size with constrained p and n
  mym.3 <- power.3m(expr = myod1, d = 0.2, q2 = 1, q3 = 1, power = 0.8,
                 constraint = list(p = 0.5, n = 20))
  mym.3$out  # m = 16954, K = 8.3

# Power calculation
  mypower <- power.3m(expr = myod1, q2 = 1, q3 = 1, d = 0.2, m = 13177)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.3m(expr = myod1, q2 = 1, q3 = 1, d = 0.2, m = 13177,
                 constraint = list(p = 0.5))
  mypower.1$out  # power = 0.69

# MDES calculation
  mymdes <- power.3m(expr = myod1, q2 = 1, q3 = 1, power = 0.80, m = 13176)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size
  myK <- power.3m(cost.model = FALSE, expr = myod1, d = 0.2, q2 = 1, q3 = 1, power = 0.8)
  myK$out  # K = 11.5
  # myK$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myK <- power.3m(cost.model = FALSE, d = 0.2, power = 0.8, q2 = 1, q3 = 1,
                  icc2 = 0.2, icc3 = 0.1, omega = 0.02,
                  r12 = 0.5, r22 = 0.5, r32m = 0.5,
                  c1 = 1, c2 = 5,
                  c1t = 1, c2t = 200, c3 = 200,
                  n = 13, J = 15, p = 0.23)

# Power calculation
  mypower1 <- power.3m(cost.model = FALSE, expr = myod1, K = 11.5, d = 0.2, q2 = 1, q3 = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.3m(cost.model = FALSE, expr = myod1, K = 11.5, power = 0.8, q2 = 1, q3 = 1)
  mymdes1$out  # d = 0.20




