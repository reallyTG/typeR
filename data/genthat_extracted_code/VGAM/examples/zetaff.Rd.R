library(VGAM)


### Name: zetaff
### Title: Zeta Distribution Family Function
### Aliases: zetaff
### Keywords: models regression

### ** Examples

zdata <- data.frame(y = 1:5, w =  c(63, 14, 5, 1, 2))  # Knight, p.304
fit <- vglm(y ~ 1, zetaff, data = zdata, trace = TRUE, weight = w, crit = "c")
(phat <- Coef(fit))  # 1.682557
with(zdata, cbind(round(dzeta(y, phat) * sum(w), 1), w))

with(zdata, weighted.mean(y, w))
fitted(fit, matrix = FALSE)
predict(fit)

# The following should be zero at the MLE:
with(zdata, mean(log(rep(y, w))) + zeta(1+phat, deriv = 1) / zeta(1+phat))



