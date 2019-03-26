library(VGAM)


### Name: betabinomialff
### Title: Beta-binomial Distribution Family Function
### Aliases: betabinomialff
### Keywords: models regression

### ** Examples

# Example 1
N <- 10; s1 <- exp(1); s2 <- exp(2)
y <- rbetabinom.ab(n = 100, size = N, shape1 = s1, shape2 = s2)
fit <- vglm(cbind(y, N-y) ~ 1, betabinomialff, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(fit@misc$rho)  # The correlation parameter
head(cbind(depvar(fit), weights(fit, type = "prior")))


# Example 2
fit <- vglm(cbind(R, N-R) ~ 1, betabinomialff, data = lirat,
            trace = TRUE, subset = N > 1)
coef(fit, matrix = TRUE)
Coef(fit)
fit@misc$rho  # The correlation parameter
t(fitted(fit))
t(depvar(fit))
t(weights(fit, type = "prior"))
# A "loge" link for the 2 shape parameters is a logistic regression:
all.equal(c(fitted(fit)),
          as.vector(logit(predict(fit)[, 1] -
                          predict(fit)[, 2], inverse = TRUE)))


# Example 3, which is more complicated
lirat <- transform(lirat, fgrp = factor(grp))
summary(lirat)  # Only 5 litters in group 3
fit2 <- vglm(cbind(R, N-R) ~ fgrp + hb, betabinomialff(zero = 2),
           data = lirat, trace = TRUE, subset = N > 1)
coef(fit2, matrix = TRUE)
coef(fit2, matrix = TRUE)[, 1] -
coef(fit2, matrix = TRUE)[, 2]  # logit(p)
## Not run: 
##D  with(lirat, plot(hb[N > 1], fit2@misc$rho,
##D                  xlab = "Hemoglobin", ylab = "Estimated rho",
##D                  pch = as.character(grp[N > 1]), col = grp[N > 1])) 
## End(Not run)
## Not run: 
##D   # cf. Figure 3 of Moore and Tsiatis (1991)
##D with(lirat, plot(hb, R / N, pch = as.character(grp), col = grp, las = 1,
##D             xlab = "Hemoglobin level", ylab = "Proportion Dead",
##D             main = "Fitted values (lines)"))
##D 
##D smalldf <- with(lirat, lirat[N > 1, ])
##D for (gp in 1:4) {
##D   xx <- with(smalldf, hb[grp == gp])
##D   yy <- with(smalldf, fitted(fit2)[grp == gp])
##D   ooo <- order(xx)
##D   lines(xx[ooo], yy[ooo], col = gp)
##D } 
## End(Not run)



