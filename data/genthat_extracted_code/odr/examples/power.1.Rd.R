library(odr)


### Name: power.1
### Title: Budget and/or sample size, power, MDES calculation for
###   individual randomized controlled trials
### Aliases: power.1

### ** Examples

# unconstrained optimal design
  myod1 <- od.1(r12 = 0.5, c1 = 1, c1t = 5, varlim = c(0, 0.2))
  myod1$out   # p = 0.31

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.1(expr = myod1, d = 0.2, q = 1, power = 0.8)
  mym.1$out  # m = 1032 n = 461
  # mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.1(d = 0.2, power = 0.8, c1 = 1, c1t = 5,
                  r12 = 0.5, p = 0.31, q = 1)
# required budget and sample size with constrained p
  mym.2 <- power.1(expr = myod1, d = 0.2, q = 1, power = 0.8,
               constraint = list(p = 0.5))
  mym.2$out  # m = 1183, n = 394

# Power calculation
  mypower <- power.1(expr = myod1, q = 1, d = 0.2, m = 1032)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.1(expr = myod1, q = 1, d = 0.2, m = 1032,
               constraint = list(p = 0.5))
  mypower.1$out  # power = 0.74

# MDES calculation
  mymdes <- power.1(expr = myod1, q = 1, power = 0.80, m = 1032)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required sample size n
  myn <- power.1(cost.model = FALSE, expr = myod1, d = 0.2, q = 1, power = 0.8)
  myn$out  # n = 461
  # myn$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myn <- power.1(cost.model = FALSE, d = 0.2, power = 0.8,
                  r12 = 0.5, p = 0.31, q = 1)

# Power calculation
  mypower1 <- power.1(cost.model = FALSE, expr = myod1, n = 461, d = 0.2, q = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.1(cost.model = FALSE, expr = myod1, n = 461, power = 0.8, q = 1)
  mymdes1$out  # d = 0.20




