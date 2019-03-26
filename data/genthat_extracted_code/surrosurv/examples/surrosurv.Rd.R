library(surrosurv)


### Name: surrosurv
### Title: Fit and print the models for evaluating the surrogacy strength
###   of a candidate surrogate endpoint
### Aliases: surrosurv print.surrosurv plot.surrosurv predict.surrosurv
###   plot.predictSurrosurv print.predictSurrosurv
### Keywords: surrogate endpoint survival meta-analysis randomized
###   controlled trial copula Clayton Plackett Hougaard proportional hazard
###   model generalized linear mixed model Poisson

### ** Examples

  set.seed(150)
  data <- simData.re(N = 20, ni = 250,
                     R2 = 0.8, kTau = 0.4,
                     alpha = log(0.95), beta = log(0.85),
                     censorA = 15 * 365.25)
  library(survival)
  par(mfrow = 1:2)
  plot(survfit(Surv(timeS, statusS) ~ trt, data = data), lty = 1:2, 
       xscale = 365.25, main = 'Progression-Free Survival\n(S)', col = 2)
  plot(survfit(Surv(timeT, statusT) ~ trt, data = data), lty = 1:2,
       xscale = 365.25, main = 'Overall Survival\n(T)')
       
  ## No test: 
    # Long computation time!
    surrores <- surrosurv(data, verbose = TRUE)
    convergence(surrores)
    surrores
  
## End(No test)
  
  # Advanced GASTRIC data
  ## No test: 
    # Long computation time!
    data('gastadv')
    allSurroRes <- surrosurv(gastadv, c('Clayton', 'Poisson'), verbose = TRUE)
    convergence(allSurroRes)
    allSurroRes
    predict(allSurroRes)
    plot(allSurroRes)
  
## End(No test)



