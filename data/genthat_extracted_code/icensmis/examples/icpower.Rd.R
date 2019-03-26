library(icensmis)


### Name: icpower
### Title: Study design in the presence of error-prone diagnostic tests and
###   self-reported outcomes
### Aliases: icpower

### ** Examples

## First specificy survivals. Assume test times are 1:8, with survival function
## at the end time 0.9
surv <- exp(log(0.9)*(1:8)/8)

## Obtain power vs. N
pow1 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = seq(500, 1500, 50), power = NULL, rho = 0.5, alpha = 0.05,
   pmiss = 0, design = "MCAR", negpred = 1)

plot(pow1$result$N, pow1$result$power, type="l", xlab="N", ylab="power")

## Calculate sample size, assuming desired power is 0.9
pow2 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = 0, design = "MCAR",
   negpred = 1)

## When missing test is present with MCAR
pow3 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = 0.4, design = "MCAR",
   negpred = 1)

## When missing test is present with NTFP
pow4 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = 0.4, design = "NTFP",
   negpred = 1)

## When baseline misclassification is present
pow5 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = 0, design = "MCAR",
   negpred = 0.98)

## When test is  perfect and no missing test
pow6 <- icpower(HR = 2, sensitivity = 1, specificity = 1, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = 0, design = "MCAR",
   negpred = 1)

## Different missing probabilities at each test time
pow7 <- icpower(HR = 2, sensitivity = 0.55, specificity = 0.99, survivals = surv,
   N = NULL, power = 0.9, rho = 0.5, alpha = 0.05, pmiss = seq(0.1, 0.8, 0.1),
   design = "MCAR")



