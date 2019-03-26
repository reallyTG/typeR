## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(TPMplt)
head(TPMdata[,1:3])


## ------------------------------------------------------------------------
colnames(TPMdata)

## ------------------------------------------------------------------------
require(VBTree)
dl2vbt(chrvec2dl(colnames(TPMdata)))

## ---- fig.show='hide'----------------------------------------------------
Fitted_data <- AllPF(TPMdata, subsec = c(0.015, 0.2))
SSplots(Fitted_data, 2, mfrow=c(2, 2))

## ---- fig.show='hide'----------------------------------------------------
TCorrect_data <- TCorrect(TPMdata, 3, 2, 510.7896, 8050, CorrCons = 0.9, subsec=c(0.015, 0.2))
SSplots(TCorrect_data, 2, mfrow=c(2, 2))

## ------------------------------------------------------------------------
epstable <- epsExtract(TCorrect_data, eps = 0.7, lyT = 2, lySR = 3)
epstable

## ------------------------------------------------------------------------
DMM <- DMMprocess(epstable)
DMM

## ------------------------------------------------------------------------
DMM <- DMMprocess(epstable, ConsFunc = TRUE)

## ------------------------------------------------------------------------
PLTbd <- SVRModel(DMM)

## ---- fig.show='hold', fig.height=4, fig.width=6-------------------------
TPM2dplt(PLTbd)

## ------------------------------------------------------------------------
TPM3dplt(PLTbd)

