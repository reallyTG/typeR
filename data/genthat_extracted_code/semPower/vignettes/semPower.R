## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(semPower)
ap1 <- semPower.aPriori(effect = .05, effect.measure = 'RMSEA', 
                        alpha = .05, power = .80, df = 100)

## ------------------------------------------------------------------------
summary(ap1)

## ------------------------------------------------------------------------
ap2 <- semPower.aPriori(effect = .05, effect.measure = 'RMSEA', 
                        alpha = .05, power = .80, df = 100, p = 20)
summary(ap2)

## ------------------------------------------------------------------------
ap3 <- semPower.aPriori(effect = .05, effect.measure = 'RMSEA', 
                        alpha = .05, beta = .20, df = 100, p = 20)

## ------------------------------------------------------------------------
ph1 <- semPower.postHoc(effect = .05, effect.measure = 'RMSEA', 
                        alpha = .05, N = 1000, df = 100)
summary(ph1)

## ------------------------------------------------------------------------
cp1 <- semPower.compromise(effect = .08, effect.measure = 'RMSEA', 
                           abratio = 1, N = 1000, df = 100)
summary(cp1)

## ------------------------------------------------------------------------
cp2 <- semPower.compromise(effect = .08, effect.measure = 'RMSEA', 
                           abratio = 100, N = 1000, df = 100)
summary(cp2)

## ------------------------------------------------------------------------
semPower.powerPlot.byN(effect = .05, effect.measure = 'RMSEA', 
                       alpha = .05, df = 100, power.min = .05, power.max = .99)

## ------------------------------------------------------------------------
semPower.powerPlot.byEffect(effect.measure = 'RMSEA', alpha = .05, N = 500, 
                            df = 100, effect.min = .001, effect.max = .10)

## ----eval=FALSE----------------------------------------------------------
#  semPower.aPriori(alpha = .05, power = .80, df = 100,
#                   Sigma = Sigma, SigmaHat = SigmaHat)
#  semPower.postHoc(alpha = .05, N = 1000, df = 100,
#                   Sigma = Sigma, SigmaHat = SigmaHat)
#  semPower.compromise(abratio = 1, N = 1000, df = 100,
#                      Sigma = Sigma, SigmaHat = SigmaHat)
#  semPower.powerPlot.byN(alpha = .05, df = 100, power.min = .05, power.max = .99,
#                         Sigma = Sigma, SigmaHat = SigmaHat)

## ----eval=FALSE----------------------------------------------------------
#  library(lavaan)
#  
#  # define (true) population model (= H0)
#  model.pop <- '
#  f1 =~ .8*x1 + .7*x2 + .6*x3
#  f2 =~ .7*x4 + .6*x5 + .5*x6
#  f1 ~~ 1*f1
#  f2 ~~ 1*f2
#  f1 ~~ 0.5*f2
#  '
#  # define (wrong) H1 model
#  model.h1 <- '
#  f1 =~ x1 + x2 + x3
#  f2 =~ x4 + x5 + x6
#  f1 ~~ 0*f2
#  '

## ----eval=FALSE----------------------------------------------------------
#  # get population covariance matrix; equivalent to a perfectly fitting H0 model
#  cov.h0 <- fitted(sem(model.pop))$cov
#  
#  # get covariance matrix as implied by H1 model
#  res.h1 <- sem(model.h1, sample.cov = cov.h0, sample.nobs = 1000, likelihood='wishart')
#  df <- res.h1@test[[1]]$df
#  cov.h1 <- fitted(res.h1)$cov

## ----eval=FALSE----------------------------------------------------------
#  ph4 <- semPower.postHoc(SigmaHat = cov.h1, Sigma = cov.h0, alpha = .05, N = 1000, df = df)
#  summary(ph4)

## ----eval=FALSE----------------------------------------------------------
#  fitmeasures(res.h1, 'chisq')
#  ph4$fmin * (ph$N-1)

