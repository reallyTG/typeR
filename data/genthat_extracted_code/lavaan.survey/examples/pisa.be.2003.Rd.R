library(lavaan.survey)


### Name: pisa.be.2003
### Title: Belgian school childrens' math efficacy and measured ability in
###   the PISA study.
### Aliases: pisa.be.2003

### ** Examples

  data(pisa.be.2003)


  # Simplified version of Ferla et al. (2009) model.
  model.pisa <- "
      math =~ PV1MATH1 + PV1MATH2 + PV1MATH3 + PV1MATH4
      neg.efficacy =~ ST31Q01 + ST31Q02 + ST31Q03 + ST31Q04 + 
                      ST31Q05 + ST31Q06 + ST31Q07 + ST31Q08
      neg.selfconcept =~ ST32Q02 + ST32Q04 + ST32Q06 + ST32Q07 + ST32Q09
  
      neg.selfconcept ~ neg.efficacy + ESCS + male
      neg.efficacy ~ neg.selfconcept + school.type + ESCS + male
      math ~ neg.selfconcept + neg.efficacy + school.type + ESCS + male
  "
  
  # Fit the model using lavaan
  fit <- lavaan(model.pisa, data = pisa.be.2003, auto.var = TRUE, std.lv = TRUE,
    meanstructure = TRUE, int.ov.free = TRUE, estimator = "MLM")
  
  ## Not run due to CRAN policies, 
  ##    uncomment below to account for replicate weights:
  
  ## Define the survey design using the BRR replicate weights provided by PISA
  ##   Note that these settings will work for _any_ analysis of PISA data...
  #des.rep <- svrepdesign(ids = ~1, weights = ~W_FSTUWT, data = pisa.be.2003, 
  #  repweights = "W_FSTR[0-9]+", type = "Fay", rho = 0.5)
  
  ## Fit the SEM model accounting for replicate weights
  #fit.surv <- lavaan.survey(lavaan.fit = fit, survey.design =  des.rep)
  
  #fit # Show fitmeasures results
  #fit.surv # Show fitmeasures results



