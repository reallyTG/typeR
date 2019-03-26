## ----init, echo = FALSE, message = FALSE, warning = FALSE----------------
library(drugCombo)
knitr::opts_chunk$set(warning = TRUE, echo = TRUE, cache = FALSE, message = FALSE)

## ----data----------------------------------------------------------------
data("checkerboardData", package = "drugCombo")
data("rayData", package = "drugCombo")

## ----mono----------------------------------------------------------------
gridData <- checkerboardData[checkerboardData$exp == 1, ]  # subset the data

monoGrid <- fitMarginals(gridData, fixed = c(b = 1))
monoRay <- fitMarginals(rayData)

## ----mono-plots----------------------------------------------------------
summary(monoGrid)
plot(monoGrid)
summary(monoRay)
plot(monoRay)

## ----fitLin, eval = 1----------------------------------------------------
fitLin1 <- fitModel(data = gridData, mono = monoGrid, model = "linear1")
fitLin1b <- fitModel(gridData, monoGrid, tauFormula = ~ log10(d1))
fitLin1c <- fitModel(gridData, monoGrid, tauFormula = ~ tau1+tau2*log10(d1))

## ----fit1vs2, eval = FALSE-----------------------------------------------
#  fitLin1St2 <- fitModel(gridData, monoGrid, model = "linear1", stage = 2)

## ----fitSep, eval = 1----------------------------------------------------
fitSep1 <- fitModel(gridData, monoGrid, model = "separate1", tauLog = TRUE)
fitSep2 <- fitModel(gridData, monoGrid, model = "separate2", tauLog = TRUE, fixed = c(b = 1, h2 = 3.494))

## ----inactive------------------------------------------------------------
fitInactive1 <- fitModel(gridData, model = "uniform", inactiveIn = 1)
summary(fitInactive1)

## ----fitRay--------------------------------------------------------------
fitRay <- fitModel(rayData, monoRay, tauFormula = ~ 0+ray)

## ----fitComplex----------------------------------------------------------
fitExp1 <- fitModel(gridData, monoGrid, tauFormula = ~ exp(tau1+tau2*log(d1)), stage = 1)
fitExp1St2 <- fitModel(gridData, monoGrid, tauFormula = ~ exp(tau1+tau2*log(d1)), stage = 2)
fitZhao <- fitModel(gridData, monoGrid, model = "zhao", tauStart = 0)

## ----nlssummary----------------------------------------------------------
summary(fitExp1)

## ----pl1-----------------------------------------------------------------
plot(fitExp1)

## ----pl2-----------------------------------------------------------------
plot(fitExp1, which = "2d", side = "d1")
plot(fitRay, which = "2d", side = "total")

## ----pl3, warning = FALSE------------------------------------------------
plot(fitExp1, which = "3d", widget = TRUE)

## ----pldouble------------------------------------------------------------
plot(fitExp1, fitExp1St2, modelNames = c("1-stage", "2-stage"))

## ----tau1, warning = TRUE------------------------------------------------
tauSurface1 <- getTauSurface(fitExp1, method = "default") 
tauSurface1b <- getTauSurface(fitExp1, method = "boot", niter = 5)

tauSurface2 <- getTauSurface(fitExp1St2, method = "default") 
tauZhao <- getTauSurface(fitZhao)

## ----tau1b---------------------------------------------------------------
tauSurface2b <- getTauSurface(fitExp1St2, method = "boot", niter = 5)

## ----taupl1--------------------------------------------------------------
plot(tauSurface1)
plot(tauSurface1, which = "3d", widget = TRUE)

## ----taudualpl-----------------------------------------------------------
plot(tauSurface1b, tauSurface2b, tauNames = c("1-stage", "2-stage"))
plot(tauSurface1, tauSurface1b, tauNames = c("wald CI", "bootstrap CI"))

## ----tauray--------------------------------------------------------------
tauRay <- getTauSurface(fitRay)
plot(tauRay)

## ----tauray2-------------------------------------------------------------
plot(tauRay, side = "ray", colorBy = "ray")

## ----tauContour, cache = FALSE, fig.width = 10.5, fig.height = 6, out.width = "96%"----
contour(tauSurface1)
contour(tauZhao)

## ----tauTable------------------------------------------------------------
knitr::kable(unique(tauSurface1))

## ----modelComp, message = FALSE------------------------------------------
fitAdd <- fitModel(gridData, monoGrid, model = "additive")
fitUni <- fitModel(gridData, monoGrid, model = "uniform")

models <- list(fitAdd, fitUni, fitLin1, fitSep1)

anova1 <- do.call(anova, models)
rownames(anova1) <- c("1. Additive", "2. Uniform", "3. Linear drug 1", "4. Separate drug 1")

icTab <- cbind(AIC = sapply(models, AIC), BIC = sapply(models, BIC))

knitr::kable(list(anova1, icTab), digits = 3)

