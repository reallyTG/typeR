library(inctools)


### Name: incprecision
### Title: Precision and Required Sample Size
### Aliases: incprecision

### ** Examples

incprecision(I = 0.015, RSE_I = 0.25, PrevH = 0.2, CR = 1,
MDRI = 200, RSE_MDRI = 0.05, FRR = 0.01, RSE_FRR = 0.2,
BigT = 730, DE_H = 1.1, DE_R = 1, n = 'out')

incprecision(I = c(0.015,0.02), RSE_I = 0.25, PrevH = c(0.10,0.20),
CR = 1, MDRI = 200, RSE_MDRI = 0.05, FRR = 0.01, RSE_FRR = 0.2,
BigT = 700, DE_H = 1, DE_R = 1, n = 'out', step = 5)

incprecision(I = 0.017, RSE_I = 'out', PrevH = c(0.10,0.20),
CR = 1, MDRI = 211, RSE_MDRI = 0.05, FRR = 0.009, RSE_FRR = 0.2,
BigT = 720, n = 5000, step = 5)



