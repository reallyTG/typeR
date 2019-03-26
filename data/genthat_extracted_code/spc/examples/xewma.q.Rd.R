library(spc)


### Name: xewma.q
### Title: Compute RL quantiles of EWMA control charts
### Aliases: xewma.q xewma.q.crit
### Keywords: ts

### ** Examples

## Gan (1993), two-sided EWMA with fixed control limits
## some values of his Table 1 -- any median RL should be 500
XEWMA.Q <- Vectorize("xewma.q", c("l", "c"))
G.lambda <- c(.05, .1, .15, .2, .25)
G.h <- c(.441, .675, .863, 1.027, 1.177)
MEDIAN <- ceiling(XEWMA.Q(G.lambda, G.h/sqrt(G.lambda/(2-G.lambda)),
0, .5, sided="two"))
print(cbind(G.lambda, MEDIAN))

## increase accuracy of thresholds

# (i) calculate threshold for given in-control median value by
#     deplyoing secant rule
XEWMA.q.crit <- Vectorize("xewma.q.crit", "l")

# (ii) re-calculate the thresholds and remove the standardization step
L0 <- 500
G.h.new <- XEWMA.q.crit(G.lambda, L0, 0, .5, sided="two")
G.h.new <- round(G.h.new * sqrt(G.lambda/(2-G.lambda)), digits=5)

# (iii) compare Gan's original values and the new ones with 5 digits
print(cbind(G.lambda, G.h.new, G.h))

# (iv) calculate the new medians
MEDIAN <- ceiling(XEWMA.Q(G.lambda, G.h.new/sqrt(G.lambda/(2-G.lambda)),
0, .5, sided="two"))
print(cbind(G.lambda, MEDIAN))



