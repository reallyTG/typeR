## ------------------------------------------------------------------------
library("equateMultiple")
data("data2pl", package = "equateIRT")

## ---- message=FALSE------------------------------------------------------
library("ltm")
m1 <- ltm(data2pl[[1]] ~ z1)
m2 <- ltm(data2pl[[2]] ~ z1)
m3 <- ltm(data2pl[[3]] ~ z1)
m4 <- ltm(data2pl[[4]] ~ z1)
m5 <- ltm(data2pl[[5]] ~ z1)

## ------------------------------------------------------------------------
estm1 <- import.ltm(m1, display = FALSE)
estm2 <- import.ltm(m2, display = FALSE)
estm3 <- import.ltm(m3, display = FALSE)
estm4 <- import.ltm(m4, display = FALSE)
estm5 <- import.ltm(m5, display = FALSE)
estm1$coef[1:3, ]
estm1$var[1:3, 1:3]

## ------------------------------------------------------------------------
estc <- list(estm1$coef, estm2$coef, estm3$coef, estm4$coef, estm5$coef)
estv <- list(estm1$var, estm2$var, estm3$var, estm4$var, estm5$var)
test <- paste("test", 1:5, sep = "")

## ------------------------------------------------------------------------
mods <- modIRT(coef = estc, var = estv, names = test, display = FALSE)
coef(mods$test1)[1:5]

## ------------------------------------------------------------------------
lplan<-linkp(coef = estc)
lplan

## ------------------------------------------------------------------------
eqMM <- multiec(mods = mods, base = 1, method = "mean-mean")
summary(eqMM)

## ------------------------------------------------------------------------
eqMGM <- multiec(mods = mods, base = 1, method = "mean-gmean")
summary(eqMGM)

## ------------------------------------------------------------------------
eqIRF<-multiec(mods = mods, base = 1, method = "irf")
summary(eqIRF)

## ------------------------------------------------------------------------
eqMGM <- multiec(mods = mods, base = 1, method = "mean-gmean", se = FALSE)
eqIRF<-multiec(mods = mods, base = 1, method = "irf", start = eqMGM)
summary(eqIRF)

## ------------------------------------------------------------------------
eqTRF<-multiec(mods = mods, base = 1, method = "trf")
summary(eqTRF)

## ------------------------------------------------------------------------
eqIRF$as
eqIRF$bs
eqIRF$se.as
eqIRF$se.bs

## ------------------------------------------------------------------------
scTSE<-score(eqIRF)
round(scTSE,3)

## ------------------------------------------------------------------------
scOSE<-score(eqIRF, method = "OSE", se = FALSE)
round(scOSE,3)

