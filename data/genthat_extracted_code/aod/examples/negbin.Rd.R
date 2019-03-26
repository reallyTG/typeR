library(aod)


### Name: negbin
### Title: Negative-Binomial Model for Counts
### Aliases: negbin
### Keywords: regression

### ** Examples

  # without offset
  data(salmonella)
  negbin(y ~ log(dose + 10) + dose, ~ 1, salmonella)
  library(MASS) # function glm.nb in MASS
  fm.nb <- glm.nb(y ~ log(dose + 10) + dose,
                  link = log, data = salmonella)
  coef(fm.nb)
  1 / fm.nb$theta # theta = 1 / phi
  c(logLik(fm.nb), AIC(fm.nb))
  # with offset
  data(dja)
  negbin(y ~ group + offset(log(trisk)), ~ group, dja)
  # phi fixed to zero in group TREAT
  negbin(y ~ group + offset(log(trisk)), ~ group, dja,
    fixpar = list(4, 0))
  # glim without overdispersion
  summary(glm(y ~ group + offset(log(trisk)),
    family = poisson, data = dja))
  # phi fixed to zero in both groups
  negbin(y ~ group + offset(log(trisk)), ~ group, dja,
    fixpar = list(c(3, 4), c(0, 0))) 
  


