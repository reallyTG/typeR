library(aod)


### Name: betabin
### Title: Beta-Binomial Model for Proportions
### Aliases: betabin
### Keywords: regression

### ** Examples

  data(orob2)
  fm1 <- betabin(cbind(y, n - y) ~ seed, ~ 1, data = orob2)
  fm2 <- betabin(cbind(y, n - y) ~ seed + root, ~ 1, data = orob2)
  fm3 <- betabin(cbind(y, n - y) ~ seed * root, ~ 1, data = orob2)
  # show the model
  fm1; fm2; fm3
  # AIC
  AIC(fm1, fm2, fm3)
  summary(AIC(fm1, fm2, fm3), which = "AICc")
  # Wald test for root effect
  wald.test(b = coef(fm3), Sigma = vcov(fm3), Terms = 3:4)
  # likelihood ratio test for root effect
  anova(fm1, fm3)
  # model predictions
  New <- expand.grid(seed = levels(orob2$seed),
                     root = levels(orob2$root))
  data.frame(New, predict(fm3, New, se = TRUE, type = "response"))
  # Djallonke sheep data
  data(dja)
  betabin(cbind(y, n - y) ~ group, ~ 1, dja)
  # heterogeneous phi
  betabin(cbind(y, n - y) ~ group, ~ group, dja,
          control = list(maxit = 1000))
  # phi fixed to zero in group TREAT
   betabin(cbind(y, n - y) ~ group, ~ group, dja,
    fixpar = list(4, 0))
  # glim without overdispersion
  summary(glm(cbind(y, n - y) ~ group,
    family = binomial, data = dja))
  # phi fixed to zero in both groups
  betabin(cbind(y, n - y) ~ group, ~ group, dja,
    fixpar = list(c(3, 4), c(0, 0))) 
  


