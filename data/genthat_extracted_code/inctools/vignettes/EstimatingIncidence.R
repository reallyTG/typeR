## ----echo=FALSE----------------------------------------------------------
library(inctools)

## ---- fig.show='hold'----------------------------------------------------
incprops(PrevH = 0.20, RSE_PrevH = 0.028, PrevR = 0.10, RSE_PrevR = 0.09,
         BS_Count = 10000, Boot = TRUE, MDRI = 200, RSE_MDRI = 0.05,
         FRR = 0.01, RSE_FRR = 0.2, BigT = 730)

## ---- fig.show='hold'----------------------------------------------------
incprops(PrevH = c(0.20,0.21,0.18), RSE_PrevH = c(0.028,0.03,0.022),
         PrevR = c(0.10,0.13,0.12), RSE_PrevR = c(0.094,0.095,0.05),
         BS_Count = 10000, Boot = FALSE, BMest = 'MDRI.FRR.indep',
         MDRI = c(200,180,180), RSE_MDRI = c(0.05,0.07,0.06),
         FRR = c(0.01,0.009,0.02), RSE_FRR = c(0.2,0.2,0.1), BigT = 730)

## ---- fig.show='hold'----------------------------------------------------
prevcounts(N = 5000, N_H = 1000, N_testR = 1000, N_R = 70, DE_H = 1.1,
           DE_R = 1.5)

## ---- fig.show='hold'----------------------------------------------------
prevcounts (N = c(5000,6000), N_H = c(1000,1100), N_testR = c(950,1060),
            N_R = c(100,70), DE_H = c(1.1,1.2), DE_R = c(1.2,1.3))

