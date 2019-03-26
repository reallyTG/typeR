library(VGAM)


### Name: posbinomial
### Title: Positive Binomial Distribution Family Function
### Aliases: posbinomial
### Keywords: models regression

### ** Examples

# Number of albinotic children in families with 5 kids (from Patil, 1962) ,,,,
albinos <- data.frame(y = c(rep(1, 25), rep(2, 23), rep(3, 10), 4, 5),
                      n = rep(5, 60))
fit1 <- vglm(cbind(y, n-y) ~ 1, posbinomial, albinos, trace = TRUE)
summary(fit1)
Coef(fit1)  # = MLE of p = 0.3088
head(fitted(fit1))
sqrt(vcov(fit1, untransform = TRUE))  # SE = 0.0322

# Fit a M_0 model (Otis et al. 1978) to the deermice data ,,,,,,,,,,,,,,,,,,,,,,,
M.0 <- vglm(cbind(    y1 + y2 + y3 + y4 + y5 + y6,
                  6 - y1 - y2 - y3 - y4 - y5 - y6) ~ 1, trace = TRUE,
            posbinomial(omit.constant = TRUE), data = deermice)
coef(M.0, matrix = TRUE)
Coef(M.0)
constraints(M.0, matrix = TRUE)
summary(M.0)
c(   N.hat = M.0@extra$N.hat,     # Since tau = 6, i.e., 6 Bernoulli trials per
  SE.N.hat = M.0@extra$SE.N.hat)  # observation is the same for each observation

# Compare it to the M_b using AIC and BIC
M.b <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ 1, trace = TRUE,
            posbernoulli.b, data = deermice)
sort(c(M.0 = AIC(M.0), M.b = AIC(M.b)))  # Okay since omit.constant = TRUE
sort(c(M.0 = BIC(M.0), M.b = BIC(M.b)))  # Okay since omit.constant = TRUE



