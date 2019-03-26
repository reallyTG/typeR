library(aod)


### Name: quasibin
### Title: Quasi-Likelihood Model for Proportions
### Aliases: quasibin
### Keywords: regression

### ** Examples

  data(orob2) 
  fm1 <- glm(cbind(y, n - y) ~ seed * root,
             family = binomial, data = orob2)
  fm2 <- quasibin(cbind(y, n - y) ~ seed * root,
                  data = orob2, phi = 0)
  fm3 <- quasibin(cbind(y, n - y) ~ seed * root,
                  data = orob2)
  rbind(fm1 = coef(fm1), fm2 = coef(fm2), fm3 = coef(fm3))
  # show the model
  fm3
  # dispersion parameter and goodness-of-fit statistic
  c(phi = fm3@phi, 
    X2 = sum(residuals(fm3, type = "pearson")^2))
  # model predictions
  predfm1 <- predict(fm1, type = "response", se = TRUE)
  predfm3 <- predict(fm3, type = "response", se = TRUE)
  New <- expand.grid(seed = levels(orob2$seed),
                     root = levels(orob2$root))
  predict(fm3, New, se = TRUE, type = "response")
  data.frame(orob2, p1 = predfm1$fit, 
                    se.p1 = predfm1$se.fit,
                    p3 = predfm3$fit,
                    se.p3 = predfm3$se.fit)
  fm4 <- quasibin(cbind(y, n - y) ~ seed + root,
                  data = orob2, phi = fm3@phi)
  # Pearson's chi-squared goodness-of-fit statistic
  # compare with fm3's X2
  sum(residuals(fm4, type = "pearson")^2)
  


