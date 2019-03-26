library(odr)


### Name: power.4m
### Title: Budget and/or sample size, power, MDES calculation for
###   four-level multisite randomized trials
### Aliases: power.4m

### ** Examples

# unconstrained optimal design #---------
  myod1 <- od.4m(icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
              r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
              c1 = 1, c2 = 5, c3 = 25,
              c1t = 1, c2t = 50, c3t = 250, c4 = 500,
              varlim = c(0, 0.005))
  myod1$out # n = 8.3, J = 3.2, K = 4.9, p = 0.36

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.4m(expr = myod1, d = 0.2, q3 = 1, q4 = 1, power = 0.8)
  mym.1$out  # m = 28668, L = 19.5
  # mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.4m(d = 0.2, power = 0.8, q3 = 1, q4 = 1,
                 icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
                 r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
                 c1 = 1, c2 = 5, c3 = 25,
                 c1t = 1, c2t = 50, c3t = 250, c4 = 500,
                 n = 8, J = 3, K = 5, p = 0.36)
# required budget and sample size with constrained p
  mym.2 <- power.4m(expr = myod1, d = 0.2, q3 = 1, q4 = 1, power = 0.8,
                 constraint = list(p = 0.5))
  mym.2$out  # m = 31379, L = 18.2
# required budget and sample size with constrained p and n
  mym.3 <- power.4m(expr = myod1, d = 0.2, q3 = 1, q4 = 1, power = 0.8,
                 constraint = list(p = 0.5, n = 20))
  mym.3$out  # m = 32257, L = 17.0

# Power calculation
  mypower <- power.4m(expr = myod1, q3 = 1, q4 = 1, d = 0.2, m = 28668)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.4m(expr = myod1, q3 = 1, q4 = 1, d = 0.2, m = 28668,
                 constraint = list(p = 0.5))
  mypower.1$out  # power = 0.76

# MDES calculation
  mymdes <- power.4m(expr = myod1, q3 = 1, q4 = 1, power = 0.80, m = 28668)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size
  myL <- power.4m(cost.model = FALSE, expr = myod1, d = 0.2, q3 = 1, q4 = 1, power = 0.8)
  myL$out  # L = 19.5
  # myL$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myL <- power.4m(cost.model = FALSE, d = 0.2, power = 0.8, q3 = 1, q4 = 1,
                  icc2 = 0.2, icc3 = 0.1, icc4 = 0.05, omega = 0.02,
                 r12 = 0.5, r22 = 0.5, r32 = 0.5, r42m = 0.5,
                 c1 = 1, c2 = 5, c3 = 25,
                 c1t = 1, c2t = 50, c3t = 250, c4 = 500,
                 n = 8, J = 3, K = 5, p = 0.36)

# Power calculation
  mypower1 <- power.4m(cost.model = FALSE, expr = myod1, L = 19.5, d = 0.2, q3 = 1, q4 = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.4m(cost.model = FALSE, expr = myod1, L = 19.5, power = 0.8, q3 = 1, q4 = 1)
  mymdes1$out  # d = 0.20




