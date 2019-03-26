## ---- include = FALSE----------------------------------------------------
library(gt4ireval)
knitr::opts_chunk$set(fig.dpi = 96, fig.width = 5, fig.asp = 1 / 1.4)

## ------------------------------------------------------------------------
dim(adhoc3)
adhoc3[1:5, 1:5]

## ------------------------------------------------------------------------
gstudy(adhoc3)

## ------------------------------------------------------------------------
adhoc3.g <- gstudy(adhoc3, drop = .25)
adhoc3.g

## ------------------------------------------------------------------------
dstudy(adhoc3.g)

## ------------------------------------------------------------------------
dstudy(adhoc3.g, queries = seq(20, 200, 20))

## ------------------------------------------------------------------------
dstudy(adhoc3.g, stability = c(0.8, 0.85, 0.9, 0.95, 0.97, 0.99))

## ------------------------------------------------------------------------
dstudy(adhoc3.g, alpha = c(0.005, 0.025, 0.05))

## ------------------------------------------------------------------------
adhoc3.g <- gstudy(adhoc3, drop = 0.25)
names(adhoc3.g)
adhoc3.g$var.s

adhoc3.d <- dstudy(adhoc3.g, queries = seq(10, 100, 10), stability = seq(0.5, 0.99, .05))
names(adhoc3.d)
adhoc3.d$Erho2
cbind(lwr = adhoc3.d$n.q_Phi.lwr, upr = adhoc3.d$n.q_Phi.upr)

## ------------------------------------------------------------------------
xx <- seq(10, 200, 5)
adhoc3.d <- dstudy(adhoc3.g, queries = xx)
plot(xx, adhoc3.d$Erho2,
     yaxs = "i", ylim = c(0.75, 1), lwd = 2, type = "l",
     xlab = "Number of queries", ylab = "Relative stability")
lines(xx, adhoc3.d$Erho2.lwr) # lower confidence limit
lines(xx, adhoc3.d$Erho2.upr) # upper confidence limit
grid()

## ------------------------------------------------------------------------
gt2tau(Erho2 = 0.95)
gt2rsens(Phi = 0.8)

## ------------------------------------------------------------------------
xx <- seq(10, 200, 5)
adhoc3.d <- dstudy(adhoc3.g, queries = xx)
plot(xx, gt2tau(adhoc3.d$Erho2),
     yaxs = "i", ylim = c(0.5, 1), lwd = 2, type = "l",
     xlab = "Number of queries", ylab = "Kendall rank correlation")
lines(xx, gt2tau(adhoc3.d$Erho2.lwr)) # lower confidence limit
lines(xx, gt2tau(adhoc3.d$Erho2.upr)) # upper confidence limit
grid()

