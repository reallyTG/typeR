library(mclogit)


### Name: mclogit
### Title: Conditional Logit Models and Mixed Conditional Logit Models
### Aliases: mclogit predict.mclogit anova.mclogit print.mclogit
###   vcov.mclogit deviance.mclogit logLik.mclogit summary.mclogit
###   print.summary.mclogit fitted.mclogit predict.mclogit
###   residuals.mclogit AIC.mclogit BIC.mclogit anova.mclogit
### Keywords: models regression

### ** Examples

data(Transport)

summary(mclogit(
  cbind(resp,suburb)~distance+cost,
  data=Transport
  ))

data(electors)

summary(mclogit(
  cbind(Freq,interaction(time,class))~econ.left/class+welfare/class+auth/class,
  random=~1|party.time,
  data=within(electors,party.time<-interaction(party,time))))



