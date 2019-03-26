library(VGAM)


### Name: betabinomial
### Title: Beta-binomial Distribution Family Function
### Aliases: betabinomial
### Keywords: models regression

### ** Examples

# Example 1
bdata <- data.frame(N = 10, mu = 0.5, rho = 0.8)
bdata <- transform(bdata,
                   y = rbetabinom(100, size = N, prob = mu, rho = rho))
fit <- vglm(cbind(y, N-y) ~ 1, betabinomial, data = bdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(cbind(depvar(fit), weights(fit, type = "prior")))


# Example 2
fit <- vglm(cbind(R, N-R) ~ 1, betabinomial, lirat,
            trace = TRUE, subset = N > 1)
coef(fit, matrix = TRUE)
Coef(fit)
t(fitted(fit))
t(depvar(fit))
t(weights(fit, type = "prior"))


# Example 3, which is more complicated
lirat <- transform(lirat, fgrp = factor(grp))
summary(lirat)  # Only 5 litters in group 3
fit2 <- vglm(cbind(R, N-R) ~ fgrp + hb, betabinomial(zero = 2),
             data = lirat, trace = TRUE, subset = N > 1)
coef(fit2, matrix = TRUE)
## Not run: 
##D  with(lirat, plot(hb[N > 1], fit2@misc$rho,
##D                  xlab = "Hemoglobin", ylab = "Estimated rho",
##D                  pch = as.character(grp[N > 1]), col = grp[N > 1])) 
## End(Not run)
## Not run: 
##D   # cf. Figure 3 of Moore and Tsiatis (1991)
##D with(lirat, plot(hb, R / N, pch = as.character(grp), col = grp,
##D                  xlab = "Hemoglobin level", ylab = "Proportion Dead",
##D                  main = "Fitted values (lines)", las = 1))
##D smalldf <- with(lirat, lirat[N > 1, ])
##D for (gp in 1:4) {
##D   xx <- with(smalldf, hb[grp == gp])
##D   yy <- with(smalldf, fitted(fit2)[grp == gp])
##D   ooo <- order(xx)
##D   lines(xx[ooo], yy[ooo], col = gp)
##D } 
## End(Not run)



