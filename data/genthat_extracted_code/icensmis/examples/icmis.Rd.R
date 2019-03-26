library(icensmis)


### Name: icmis
### Title: Maximum likelihood estimation for settings of error-prone
###   diagnostic tests and self-reported outcomes
### Aliases: icmis

### ** Examples

## One sample setting
simdata1 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = NULL, twogroup = NULL, pmiss = 0.3, design = "MCAR")
fit1 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata1,
  sensitivity = 0.7, specificity= 0.98, formula = NULL, negpred = 1)

## Two group setting, and the two groups have same sample sizes
simdata2 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = 0.7, twogroup = 0.5, pmiss = 0.3, design = "MCAR")
fit2 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata2,
  sensitivity = 0.7, specificity= 0.98, formula = ~group)

## Three covariates with coefficients 0.5, 0.8, and 1.0
simdata3 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 1)
fit3 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata3,
  sensitivity = 0.7, specificity= 0.98, formula = ~cov1+cov2+cov3, negpred = 1)

## Fit data with NTFP missing mechanism (the fitting is same as MCAR data)
simdata4 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "NTFP", negpred = 1)
fit4 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata4,
  sensitivity = 0.7, specificity= 0.98, formula = ~cov1+cov2+cov3, negpred = 1)

## Fit data with baseline misclassification
simdata5 <- datasim(N = 2000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 0.97)
fit5 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata5,
  sensitivity = 0.7, specificity= 0.98, formula = ~cov1+cov2+cov3, negpred = 0.97)

## Fit data with time varying covariates
simdata6 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 1, time.varying = TRUE)
fit6 <- icmis(subject = ID, testtime = testtime, result = result, data = simdata6,
   sensitivity = 0.7, specificity= 0.98, formula = ~cov1+cov2+cov3, negpred = 1,
   time.varying = TRUE)



