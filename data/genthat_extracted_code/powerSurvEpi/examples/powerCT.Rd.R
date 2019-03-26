library(powerSurvEpi)


### Name: powerCT
### Title: Power Calculation in the Analysis of Survival Data for Clinical
###   Trials
### Aliases: powerCT
### Keywords: survival design

### ** Examples

  # Example 14.42 in Rosner B. Fundamentals of Biostatistics. 
  # (6-th edition). (2006) page 809

  library(survival)

  data(Oph)
  res <- powerCT(formula = Surv(times, status) ~ group, dat = Oph, 
    nE = 200, nC = 200, RR = 0.7, alpha = 0.05)

  # Table 14.24 on page 809 of Rosner (2006)
  print(round(res$mat.lambda, 4))

  # Table 14.12 on page 787 of Rosner (2006)
  print(round(res$mat.event, 4))

  # the power
  print(round(res$power, 2))



