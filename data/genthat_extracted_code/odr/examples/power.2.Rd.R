library(odr)


### Name: power.2
### Title: Budget and/or sample size, power, MDES calculation for two-level
###   CRTs
### Aliases: power.2

### ** Examples

# unconstrained optimal design
  myod1 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50)
  myod1$out   # n = 8.9, p = 0.33

# ------- power analyses by default considering costs and budget -------
# required budget and sample size
  mym.1 <- power.2(expr = myod1, d = 0.2, q = 1, power = 0.8)
  mym.1$out  # m = 3755, J = 130.2
  #mym.1$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  mym.1 <- power.2(d = 0.2, power = 0.8, icc = 0.2,
                 c1 = 1, c2 = 5, c1t = 1, c2t = 50,
                  r12 = 0.5, r22 = 0.5, n = 9, p = 0.33, q = 1)
# required budget and sample size with constrained p
  mym.2 <- power.2(expr = myod1, d = 0.2, q = 1, power = 0.8,
               constraint = list(p = 0.5))
  mym.2$out  # m = 4210, J = 115.3
# required budget and sample size with constrained p and n
  mym.3 <- power.2(expr = myod1, d = 0.2, q = 1, power = 0.8,
               constraint = list(p = 0.5, n = 20))
  mym.3$out  # m = 4568, J = 96.2

# Power calculation
  mypower <- power.2(expr = myod1, q = 1, d = 0.2, m = 3755)
  mypower$out  # power = 0.80
# Power calculation under constrained p (p = 0.5)
  mypower.1 <- power.2(expr = myod1, q = 1, d = 0.2, m = 3755,
               constraint = list(p = 0.5))
  mypower.1$out  # power = 0.75

# MDES calculation
  mymdes <- power.2(expr = myod1, q = 1, power = 0.80, m = 3755)
  mymdes$out  # d = 0.20


# ------- conventional power analyses with cost.model = FALSE-------
# Required J
  myJ <- power.2(cost.model = FALSE, expr = myod1, d = 0.2, q = 1, power = 0.8)
  myJ$out  # J = 130.2
  #myJ$par  # parameters and their values used for the function
# or equivalently, specify every argument in the function
  myJ <- power.2(cost.model = FALSE, d = 0.2, power = 0.8, icc = 0.2,
                  r12 = 0.5, r22 = 0.5, n = 9, p = 0.33, q = 1)

# Power calculation
  mypower1 <- power.2(cost.model = FALSE, expr = myod1, J = 130, d = 0.2, q = 1)
  mypower1$out  # power = 0.80

# MDES calculation
  mymdes1 <- power.2(cost.model = FALSE, expr = myod1, J = 130, power = 0.8, q = 1)
  mymdes1$out  # d = 0.20




