library(VGAM)


### Name: double.expbinomial
### Title: Double Exponential Binomial Distribution Family Function
### Aliases: double.expbinomial
### Keywords: models regression

### ** Examples

# This example mimics the example in Efron (1986).
# The results here differ slightly.

# Scale the variables
toxop <- transform(toxop,
                   phat = positive / ssize,
                   srainfall = scale(rainfall),  # (6.1)
                   sN = scale(ssize))            # (6.2)

# A fit similar (should be identical) to Section 6 of Efron (1986).
# But does not use poly(), and M = 1.25 here, as in (5.3)
cmlist <- list("(Intercept)"    = diag(2),
               "I(srainfall)"   = rbind(1, 0),
               "I(srainfall^2)" = rbind(1, 0),
               "I(srainfall^3)" = rbind(1, 0),
               "I(sN)" = rbind(0, 1),
               "I(sN^2)" = rbind(0, 1))
fit <- vglm(cbind(phat, 1 - phat) * ssize ~
            I(srainfall) + I(srainfall^2) + I(srainfall^3) +
            I(sN) + I(sN^2),
            double.expbinomial(ldisp = extlogit(min = 0, max = 1.25),
                         idisp = 0.2, zero = NULL),
            toxop, trace = TRUE, constraints = cmlist)

# Now look at the results
coef(fit, matrix = TRUE)
head(fitted(fit))
summary(fit)
vcov(fit)
sqrt(diag(vcov(fit)))  # Standard errors

# Effective sample size (not quite the last column of Table 1)
head(predict(fit))
Dispersion <- extlogit(predict(fit)[,2], min = 0, max = 1.25, inverse = TRUE)
c(round(weights(fit, type = "prior") * Dispersion, digits = 1))


# Ordinary logistic regression (gives same results as (6.5))
ofit <- vglm(cbind(phat, 1 - phat) * ssize ~
             I(srainfall) + I(srainfall^2) + I(srainfall^3),
             binomialff, toxop, trace = TRUE)


# Same as fit but it uses poly(), and can be plotted (cf. Figure 1)
cmlist2 <- list("(Intercept)"                 = diag(2),
                "poly(srainfall, degree = 3)" = rbind(1, 0),
                "poly(sN, degree = 2)"        = rbind(0, 1))
fit2 <- vglm(cbind(phat, 1 - phat) * ssize ~
             poly(srainfall, degree = 3) + poly(sN, degree = 2),
             double.expbinomial(ldisp = extlogit(min = 0, max = 1.25),
                          idisp = 0.2, zero = NULL),
             toxop, trace = TRUE, constraints = cmlist2)
## Not run: 
##D  par(mfrow = c(1, 2))
##D plot(as(fit2, "vgam"), se = TRUE, lcol = "blue", scol = "orange")  # Cf. Figure 1
##D 
##D # Cf. Figure 1(a)
##D par(mfrow = c(1,2))
##D ooo <- with(toxop, sort.list(rainfall))
##D with(toxop, plot(rainfall[ooo], fitted(fit2)[ooo], type = "l",
##D                  col = "blue", las = 1, ylim = c(0.3, 0.65)))
##D with(toxop, points(rainfall[ooo], fitted(ofit)[ooo], col = "orange",
##D                    type = "b", pch = 19))
##D 
##D # Cf. Figure 1(b)
##D ooo <- with(toxop, sort.list(ssize))
##D with(toxop, plot(ssize[ooo], Dispersion[ooo], type = "l", col = "blue",
##D                  las = 1, xlim = c(0, 100))) 
## End(Not run)



