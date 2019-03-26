library(ORCI)


### Name: ORCI-package
### Title: Confidence intervals for the odds ratio
### Aliases: ORCI-package ORCI
### Keywords: Confidence interval Odds ratio Woolf Gart Agresti
###   independence Inverse hyperbolic sine Median unbiased estimator MOVER
###   Cornfield Baptista-Pike

### ** Examples

# x1=2, n1=14, x2=1, n2=11
# 95% confidence interval for the odds ratio 

Agrestiind.CI(2, 14, 1, 11)
BPexact.CI(2, 14, 1, 11)
BPmidp.CI(2, 14, 1, 11)
Cornfieldexact.CI(2, 14, 1, 11)
Cornfieldmidp.CI(2, 14, 1, 11)
Gart.CI(2, 14, 1, 11)
Invsinh.CI(2, 14, 1, 11, phi.1 = 0.6, phi.2 = 0.4)
MOVER.CI(2, 14, 1, 11)
MUE.CI(2, 14, 1, 11)
Woolf.CI(2, 14, 1, 11)



