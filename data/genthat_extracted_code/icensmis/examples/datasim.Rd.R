library(icensmis)


### Name: datasim
### Title: Simulate data including multiple outcomes from error-prone
###   diagnostic tests or self-reports
### Aliases: datasim

### ** Examples

## One sample setting
simdata1 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = NULL, twogroup = NULL, pmiss = 0.3, design = "MCAR")

## Two group setting, and the two groups have same sample sizes
simdata2 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = 0.7, twogroup = 0.5, pmiss = 0.3, design = "MCAR")

## Three covariates with coefficients 0.5, 0.8, and 1.0
simdata3 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 1)

## NTFP missing mechanism
simdata4 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "NTFP", negpred = 1)

## Baseline misclassification
simdata5 <- datasim(N = 2000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 0.97)

## Time varying covariates
simdata6 <- datasim(N = 1000, blambda = 0.05, testtimes = 1:8, sensitivity = 0.7,
  specificity = 0.98, betas = c(0.5, 0.8, 1.0), twogroup = NULL, pmiss = 0.3,
  design = "MCAR", negpred = 1, time.varying = TRUE)



