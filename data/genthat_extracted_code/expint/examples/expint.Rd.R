library(expint)


### Name: expint
### Title: Exponential Integral
### Aliases: expint expint_E1 expint_E2 expint_En expint_Ei
###   ExponentialIntegral
### Keywords: math

### ** Examples

## See section 5.3 of Abramowitz and Stegun
expint(1.275, order = 1:10)
expint(10, order = 1:10) * 1e5
expint(c(1.275, 10), order = c(1, 2))

expint_E1(1.275)                        # same as above
expint_E2(10)                           # same as above

## Figure 5.1 of Abramowitz and Stegun
curve(expint_Ei, xlim = c(0, 1.6), ylim = c(-3.9, 3.9),
      ylab = "y")
abline(h = 0)
curve(expint_E1, add = TRUE)
x <- 1.5
text(x, c(expint_Ei(x), expint_E1(x)),
     expression(Ei(x), E[1](x)),
     adj = c(0.5, -0.5))

## Figure 5.2 of Abramowitz and Stegun
plot(NA, xlim = c(-1.6, 1.6), ylim = c(0, 1),
     xlab = "x", ylab = expression(E[n](x)))
n <- c(10, 5, 3, 2, 1, 0)
for (order in n)
    curve(expint_En(x, order), add = TRUE)
x <- c(0.1, 0.15, 0.25, 0.35, 0.5, 0.7)
text(x, expint(x, n), paste("n =", n),
     adj = c(-0.2, -0.5))



