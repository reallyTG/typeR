## ---- echo=FALSE---------------------------------------------------------
library("inctools")

## ---- echo=TRUE----------------------------------------------------------
incpower(I1 = 0.05, I2 = 0.03, PrevH1 = 0.20, PrevH2 = 0.20, n1 = 5000,
        n2 = 5000, alpha = 0.05,Power = "out", SS = NULL, CR = 1, DE_H = 1,
        DE_R = 1, BMest = "same.test", MDRI = 200, RSE_MDRI = 0.05, FRR = 0.01,
        RSE_FRR = 0.20, BigT = 730)

## ---- echo=TRUE----------------------------------------------------------
incpower(I1 = 0.05, I2 = 0.03, PrevH1 = 0.20, PrevH2 = 0.15, alpha = 0.05,
        Power = 0.8, SS = "out", CR = 1, DE_H = 1, DE_R = 1,
        BMest = "FRR.indep", MDRI = 200, RSE_MDRI = 0.05, FRR = c(0.01,0.009),
        RSE_FRR = c(0.20,0.22), BigT = 730)

## ---- echo=TRUE----------------------------------------------------------
incprecision(I = 0.015, RSE_I = 0.25, PrevH = 0.2, CR = 1, MDRI = 200,
            RSE_MDRI = 0.05, FRR = 0.01, RSE_FRR = 0.2, BigT = 730,
            DE_H = 1.1, DE_R = 1.1, n = 'out')

## ---- echo=TRUE----------------------------------------------------------
incprecision(I = c(0.015,0.02), RSE_I = 0.25, PrevH = c(0.10,0.20), CR = 1,
             MDRI = 200, RSE_MDRI = 0.05, FRR = 0.01, RSE_FRR = 0.2, BigT = 700,
             DE_H = 1, DE_R = 1, n = 'out', step = 3)

## ---- echo=TRUE----------------------------------------------------------
incprecision(I = 0.017, RSE_I = 'out', PrevH = c(0.10,0.20), CR = 1, MDRI = 211,
             RSE_MDRI = 0.05, FRR = 0.009, RSE_FRR = 0.2, BigT = 720, n = 5000,
             step = 5)

