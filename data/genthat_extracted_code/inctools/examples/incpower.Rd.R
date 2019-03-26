library(inctools)


### Name: incpower
### Title: Power and Required Sample Size
### Aliases: incpower

### ** Examples

incpower(I1 = 0.05, I2 = 0.03, PrevH1 = 0.20, PrevH2 = 0.20,
n1 = 5000, n2 = 5000, alpha = 0.05, Power = "out", SS = NULL,
DE_H = c(1,1.1), DE_R = 1, BMest = 'same.test', MDRI = 200,
RSE_MDRI = 0.05, FRR = 0.01, RSE_FRR = 0.20, BigT = 730)


incpower(I1 = 0.05, I2 = 0.03, PrevH1 = 0.20, PrevH2 = 0.20,
alpha = 0.05, Power = 0.80, SS = "out", DE_H = 1, DE_R = 1,
BMest = 'FRR.indep', MDRI = 200, RSE_MDRI = 0.05,
FRR = c(0.01,0.009), RSE_FRR = c(0.20,0.21), BigT = 730)



