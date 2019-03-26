library(lavaan.survey)


### Name: ess4.gb
### Title: British attitudes towards the welfare state.
### Aliases: ess4.gb

### ** Examples

  data(ess4.gb)
  
  # Two-factor model based on Roosma et al (2013).
  model.cfa <-    
    "range =~ gvjbevn + gvhlthc + gvslvol + gvslvue + gvcldcr + gvpdlwk
     goals =~ sbprvpv  +  sbeqsoc  +  sbcwkfm"
  
  # Fit the model using lavaan
  fit.cfa.ml <- lavaan(model.cfa, data = ess4.gb, estimator = "MLM",
    meanstructure = TRUE, int.ov.free = TRUE, auto.var = TRUE, 
    auto.fix.first = TRUE, auto.cov.lv.x = TRUE)
  fit.cfa.ml
  
  # Define the complex survey design for ESS 4 in the UK
  des.gb <- svydesign(ids = ~psu, strata = ~stratval, weights = ~dweight, 
    data = ess4.gb)
  
  # Fit the two-factor model while taking the survey design into account.
  fit.cfa.surv <- lavaan.survey(fit.cfa.ml, survey.design = des.gb)
  fit.cfa.surv



