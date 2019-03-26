library(TempCont)


### Name: temp.cont
### Title: TempCont: Temporal contributions on trends using mixed models
### Aliases: temp.cont TempCont

### ** Examples

  library (nlme)
  data(tempcont_data)
  mod <- lme(trolls ~ bushes + temperature  + rainfall + drought + gremlins +
              orcs + warlocks, data=tempcont_data, random=~1|cave,
              correlation=corCAR1(form=~year|cave), method="ML")
  summary(mod)

  temp.cont(model = mod, driver="temperature", random="cave")

  # Warning: long runtime (> 20 seconds)
  ## No test: 
temp.cont(model = mod, random="cave")
## End(No test)



