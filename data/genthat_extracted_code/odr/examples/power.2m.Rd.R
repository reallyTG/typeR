library(odr)


### Name: power.2m
### Title: Budget and/or sample size, power, MDES calculation for two-level
###   multisite randomized trials
### Aliases: power.2m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.2m(icc = 0.2, omega = 0.02, r12 = 0.5, r22m = 0.5,
              c1 = 1, c2 = 10, c1t = 10,
              varlim = c(0, 0.005))
  myod1$out # n = 20, p = 0.37

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.2m(expr = myod1, d = 0.2, q1 = 1, q2 = 1, power = 0.8)
  mym.1$out  # m = 612, J = 6.3
  # mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.2m(d = 0.2, power = 0.8, q1 = 1, q2 = 1,
                 icc = 0.2, omega = 0.02, r12 = 0.5, r22m = 0.5,
                 c1 = 1, c2 = 10, c1t = 10,
                 n = 20, p = 0.37)
# required budget and sample size with constrained p
  mym.2 <- power.2m(expr = myod1, d = 0.2, q1 = 1, q2 = 1, power = 0.8,
                 constraint = list(p = 0.5))
  mym.2$out  # m = 726, J = 6.1
# required budget and sample size with constrained p and n
  mym.3 <- power.2m(expr = myod1, d = 0.2, q1 = 1, q2 = 1, power = 0.8,
                 constraint = list(p = 0.5, n = 5))
  mym.3$out  # m = 702, J = 18.7

# Power calculation
  mypower <- power.2m(expr = myod1, q1 = 1, q2 = 1, d = 0.2, m = 612)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.2m(expr = myod1, q1 = 1, q2 = 1, d = 0.2, m = 612,
                 constraint = list(p = 0.5))
  mypower.1$out  # power = 0.73

# MDES calculation
  mymdes <- power.2m(expr = myod1, q1 = 1, q2 = 1, power = 0.80, m = 612)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size
  myJ <- power.2m(cost.model = FALSE, expr = myod1, d = 0.2, q1 = 1, q2 = 1, power = 0.8)
  myJ$out  # J = 6.3
  # myL$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myJ <- power.2m(cost.model = FALSE, d = 0.2, power = 0.8, q1 = 1, q2 = 1,
                 icc = 0.2, omega = 0.02, r12 = 0.5, r22m = 0.5,
                 c1 = 1, c2 = 10, c1t = 10,
                 n = 20, p = 0.37)

# Power calculation
  mypower1 <- power.2m(cost.model = FALSE, expr = myod1, J = 6.3, d = 0.2, q1 = 1, q2 = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.2m(cost.model = FALSE, expr = myod1, J = 6.3, power = 0.8, q1 = 1, q2 = 1)
  mymdes1$out  # d = 0.20




