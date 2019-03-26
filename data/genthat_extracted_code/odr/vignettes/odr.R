## ------------------------------------------------------------------------
library(odr)

## ----fig.width = 7, fig.height = 3.5-------------------------------------
 # unconstrained optimal design
myod1 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50, 
              varlim = c(0.01, 0.02))
 # The function by default prints messages of output and plots the variance curves; one can turn off message and specify one or no plot; default m value is the total costs of sampling 60 level-2 units across treatment conditions, m can be explicitly specified.
 # myod1$out # output; 
 # myod1$par # parameters used in the calculation.

## ----fig.width = 5, fig.height = 5---------------------------------------
 # constrained optimal design with n = 20
myod2 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              plot.by = list(p = "p"), n = 20, varlim = c(0.005, 0.030))
 # myod2$out # output
 # myod2$par # parameters used in the calculation.

## ----fig.width = 7, fig.height = 3.5-------------------------------------
 # constrained optimal design with p = 0.5
myod3 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50, 
             p = 0.5, varlim = c(0.005, 0.020))
 # myod3$out # output; 
 # myod3$par # parameters used in the calculation.

## ----fig.width = 7, fig.height = 3.5-------------------------------------
 # constrained n and p, no calculation performed
myod4 <- od.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
              plots = FALSE, n = 20, p = 0.5, varlim = c(0.005, 0.025))

## ------------------------------------------------------------------------
# ?od.1
# ?od.3
# ?od.4
# ?od.2m
# ?od.3m
# ?od.4m

## ------------------------------------------------------------------------
mym <- power.2(expr = myod1, d = 0.3, q = 1, power = 0.8)
# mym$out  # m =1702, J = 59

## ----fig.width = 7, fig.height = 3.5-------------------------------------
figure <- par(mfrow = c(1, 2))
budget <- NULL
nrange <- c(2:50)
for (n in nrange)
  budget <- c(budget, power.2(expr = myod1, constraint = list (n = n), d = 0.3, q = 1, power = 0.8)$out$m)
plot(nrange, budget, type = "l", lty = 1, xlim = c(0, 50), ylim = c(1500, 3500),
     xlab = "Level-1 sample size: n", ylab = "Budget", main = "", col = "black")
 abline(v = 9, lty = 2, col = "Blue")
 
budget <- NULL
prange <- seq(0.05, 0.95, by = 0.005)
for (p in prange)
  budget <- c(budget, power.2(expr = myod1, constraint = list (p = p), d = 0.3, q = 1, power = 0.8)$out$m)
plot(prange, budget, type = "l", lty = 1, xlim = c(0, 1), ylim = c(1500, 7000),
     xlab = "Porportion groups in treatment: p", ylab = "Budget", main = "", col = "black")
 abline(v = 0.33, lty = 2, col = "Blue")
par(figure)

## ------------------------------------------------------------------------
mypower <- power.2(expr = myod1, q = 1, d = 0.3, m = 1702)
# mypower$out  # power = 0.80

## ----fig.width = 7, fig.height = 3.5-------------------------------------
figure <- par(mfrow = c (1, 2))
pwr <- NULL
nrange <- c(2:50)
for (n in nrange)
  pwr <- c(pwr, power.2(expr = myod1, constraint = list (n = n), d = 0.3, q = 1, m = 1702)$out)
plot(nrange, pwr, type = "l", lty = 1, xlim = c(0, 50), ylim = c(0.4, 0.9),
     xlab = "Level-1 sample size: n", ylab = "Power", main = "", col = "black")
 abline(v = 9, lty = 2, col = "Blue")
 
pwr <- NULL
prange <- seq(0.05, 0.95, by = 0.005)
for (p in prange)
  pwr <- c(pwr, power.2(expr = myod1, constraint = list (p = p), d = 0.3, q = 1, m = 1702)$out)
plot(prange, pwr, type = "l", lty = 1, xlim = c(0, 1), ylim = c(0.1, 0.9),
     xlab = "Porportion groups in treatment: p", ylab = "Power",  main = "", col = "black")
 abline(v = 0.33, lty = 2, col = "Blue")
 par(figure)

## ------------------------------------------------------------------------
mymdes <- power.2(expr = myod1, q = 1, power = 0.80, m = 1702)
# mymdes$out  # d = 0.30

## ----fig.width = 7, fig.height = 3.5-------------------------------------
figure <- par(mfrow = c (1, 2))
MDES <- NULL
nrange <- c(2:50)
for (n in nrange)
  MDES <- c(MDES, power.2(expr = myod1, constraint = list (n = n), power = 0.8, q = 1, m = 1702)$out)
plot(nrange, MDES, type = "l", lty = 1, xlim = c(0, 50), ylim = c(0.3, 0.8),
     xlab = "Level-1 sample size: n", ylab = "MDES", main = "", col = "black")
 abline(v = 9, lty = 2, col = "Blue")
 
MDES <- NULL
prange <- seq(0.05, 0.95, by = 0.005)
for (p in prange)
  MDES <- c(MDES, power.2(expr = myod1, constraint = list (p = p), power = 0.8, q = 1, m = 1702)$out)
plot(prange, MDES, type = "l", lty = 1, xlim = c(0, 1), ylim = c(0.3, 0.8),
     xlab = "Porportion groups in treatment: p", ylab = "MDES", main = "", col = "black")
 abline(v = 0.33, lty = 2, col = "Blue")
 par(figure)

## ------------------------------------------------------------------------
# Required level-2 sample size calculation
myJ <- power.2(cost.model = FALSE, expr = myod1, d = 0.3, q = 1, power = 0.8)
# above experssion takes parameters and outputs from od.2 function. Equivalently, each parameter can be explicitly specified.
# myJ <- power.2(icc = 0.2, r12 = 0.5, r22 = 0.5, c1 = 1, c2 = 5, c1t = 1, c2t = 50,
#                     cost.model = FALSE, n = 9, p = 0.33, d = 0.3, q = 1, power = 0.8)
myJ$out  # J = 59

# Power calculation
mypower1 <- power.2(cost.model = FALSE, expr = myod1, J = 59, d = 0.3, q = 1)
mypower1$out  # power = 0.80

# MDES calculation
mymdes1 <- power.2(cost.model = FALSE, expr = myod1, J = 59, power = 0.8, q = 1)
mymdes1$out  # d = 0.30

## ----fig.width = 7, fig.height = 3.5-------------------------------------
figure <- par(mfrow = c (1, 2))
pwr <- NULL
mrange <- c(300:3000)
for (m in mrange)
  pwr <- c(pwr, power.2(expr = myod1, d = 0.3, q = 1, m = m)$out)
plot(mrange, pwr, type = "l", lty = 1, xlim = c(300, 3000), ylim = c(0, 1),
     xlab = "Budget", ylab = "Power", main = "", col = "black")
 abline(v = 1702, lty = 2, col = "Blue")
 
pwr <- NULL
Jrange <- c(4:100)
for (J in Jrange)
  pwr <- c(pwr, power.2(expr = myod1, cost.model = FALSE, d = 0.3, q = 1, J = J)$out)
plot(Jrange, pwr, type = "l", lty = 1, xlim = c(4, 100), ylim = c(0, 1),
     xlab = "Level-2 sample size: J", ylab = "Power", main = "", col = "black")
 abline(v = 59, lty = 2, col = "Blue")
par(figure)

## ------------------------------------------------------------------------
# ?power.1
# ?power.3
# ?power.4
# ?power.2m
# ?power.3m
# ?power.4m

## ------------------------------------------------------------------------
# relative efficiency (RE) of constrained design comparing with the unconstrained design
myre <- re(od = myod1, subod= myod2)
myre$re # get the output (i.e., RE = 0.88)

# relative efficiency (RE) constrained design comparing with the unconstrained optimal one
myre <- re(od = myod1, subod= myod3)

# relative efficiency (RE) constrained design comparing with the unconstrained optimal one
myre <- re(od = myod1, subod= myod4)



## ------------------------------------------------------------------------
# ?od.1
# ?od.2
# ?od.3
# ?od.4
# ?od.2m
# ?od.3m
# ?od.4m

