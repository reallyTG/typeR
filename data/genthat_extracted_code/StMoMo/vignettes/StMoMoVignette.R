### R code from vignette source 'StMoMoVignette.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: SweaveOptions
###################################################
#Do this to add R> at the start of lines
#options(prompt = "R> ")
#options(continue="+  ")
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: installStMoMo (eval = FALSE)
###################################################
## install.packages("StMoMo")


###################################################
### code chunk number 3: loadStMoMo
###################################################
library("StMoMo")


###################################################
### code chunk number 4: defineLClong (eval = FALSE)
###################################################
## constLC <- function(ax, bx, kt, b0x, gc, wxt, ages){
##   c1 <- mean(kt[1, ], na.rm = TRUE)
##   c2 <- sum(bx[, 1], na.rm = TRUE)
##   list(ax = ax + c1 * bx, bx = bx / c2, kt =  c2 * (kt - c1))   
## } 
## LC <- StMoMo(link = "logit", staticAgeFun = TRUE, periodAgeFun = "NP", 
##   constFun = constLC)


###################################################
### code chunk number 5: defineLC
###################################################
LC <- lc(link = "logit")


###################################################
### code chunk number 6: defineCBDlong (eval = FALSE)
###################################################
## f2 <- function(x, ages) x - mean(ages)
## CBD <- StMoMo(link = "logit", staticAgeFun = FALSE, 
##   periodAgeFun = c("1", f2))


###################################################
### code chunk number 7: defineCBD
###################################################
CBD <- cbd()


###################################################
### code chunk number 8: defineAPC_RH_M7
###################################################
RH <- rh(link = "logit",  cohortAgeFun = "1")
APC <- apc(link = "logit")
M7 <- m7()


###################################################
### code chunk number 9: definePlat
###################################################
f2 <- function(x, ages) mean(ages) - x
constPlat <- function(ax, bx, kt, b0x, gc, wxt, ages){
  nYears <- dim(wxt)[2]
  x <- ages
  t <- 1:nYears
  c <- (1 - tail(ages, 1)):(nYears - ages[1])
  xbar <- mean(x)
  phiReg <- lm(gc ~ 1 + c + I(c ^ 2), na.action = na.omit)
  phi <- coef(phiReg)
  gc <- gc - phi[1] - phi[2] * c - phi[3] * c ^ 2 
  kt[2, ] <- kt[2, ] + 2 * phi[3] * t
  kt[1, ] <- kt[1, ] + phi[2] * t + phi[3] * (t ^ 2 - 2 * xbar * t)  
  ax <- ax + phi[1] - phi[2] * x + phi[3] * x ^ 2
  ci <- rowMeans(kt, na.rm = TRUE)
  ax <- ax + ci[1] + ci[2] * (xbar - x) 
  kt[1, ] <- kt[1, ] - ci[1]
  kt[2, ] <- kt[2, ] - ci[2]
  list(ax = ax, bx = bx, kt = kt, b0x = b0x, gc = gc)
}
PLAT <- StMoMo(link = "logit", staticAgeFun = TRUE,
  periodAgeFun = c("1", f2), cohortAgeFun = "1", constFun = constPlat)


###################################################
### code chunk number 10: showGNMformulaLC
###################################################
LC$gnmFormula


###################################################
### code chunk number 11: showGNMformulaCBD
###################################################
CBD$gnmFormula


###################################################
### code chunk number 12: EWData
###################################################
EWMaleData


###################################################
### code chunk number 13: fit1
###################################################
EWMaleIniData <- central2initial(EWMaleData)
ages.fit <- 55:89
wxt <- genWeightMat(ages = ages.fit, years = EWMaleIniData$years, 
  clip = 3)
LCfit <- fit(LC, data = EWMaleIniData, ages.fit = ages.fit, wxt = wxt)
APCfit <- fit(APC, data = EWMaleIniData, ages.fit = ages.fit, wxt = wxt)
CBDfit <- fit(CBD, data = EWMaleIniData, ages.fit = ages.fit, wxt = wxt)
M7fit <- fit(M7, data = EWMaleIniData, ages.fit = ages.fit, wxt = wxt)
PLATfit <- fit(PLAT, data = EWMaleIniData, ages.fit = ages.fit, wxt = wxt)


###################################################
### code chunk number 14: fitRH
###################################################
RHfit <- fit(RH, data = EWMaleIniData,  ages.fit = ages.fit, wxt = wxt, 
  start.ax = LCfit$ax, start.bx = LCfit$bx, start.kt = LCfit$kt)


###################################################
### code chunk number 15: plotParam (eval = FALSE)
###################################################
## plot(LCfit, nCol = 3)
## plot(CBDfit, parametricbx = FALSE)
## plot(APCfit, parametricbx = FALSE, nCol = 3)


###################################################
### code chunk number 16: plotLC
###################################################
plot(LCfit, nCol = 3)


###################################################
### code chunk number 17: plotCBD
###################################################
plot(CBDfit, parametricbx = FALSE)


###################################################
### code chunk number 18: plotAPC
###################################################
plot(APCfit, parametricbx = FALSE, nCol = 3)


###################################################
### code chunk number 19: resAll
###################################################
LCres <- residuals(LCfit)
CBDres <- residuals(CBDfit)
APCres <- residuals(APCfit)
RHres <- residuals(RHfit)
M7res <- residuals(M7fit)
PLATres <- residuals(PLATfit)


###################################################
### code chunk number 20: resLC_CBD (eval = FALSE)
###################################################
## LCres <- residuals(LCfit)
## CBDres <- residuals(CBDfit)


###################################################
### code chunk number 21: plotLCresShow (eval = FALSE)
###################################################
## plot(LCres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 22: plotResShow (eval = FALSE)
###################################################
## plot(LCres, type = "scatter", reslim = c(-3.5, 3.5))
## plot(CBDres, type = "scatter", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 23: plotLCres
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(LCres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 24: plotCBDres
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(CBDres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 25: plotAPCres
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(APCres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 26: plotRHres
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(RHres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 27: plotM7res
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(M7res, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 28: plotPLATres
###################################################
par(mar=c(4.5, 4, 1, 1))
plot(PLATres, type = "colourmap", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 29: plotLCresScatter
###################################################
plot(LCres, type = "scatter", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 30: plotCBDresScatter
###################################################
plot(CBDres, type = "scatter", reslim = c(-3.5, 3.5))


###################################################
### code chunk number 31: BICCBD
###################################################
AIC(CBDfit)
BIC(CBDfit)


###################################################
### code chunk number 32: BICtable
###################################################
library(xtable)
BICdf <-data.frame(list(LC = c(LCfit$npar[1], AIC(LCfit), BIC(LCfit)), 
                        CBD = c(CBDfit$npar[1], AIC(CBDfit), BIC(CBDfit)), 
                        APC = c(APCfit$npar[1], AIC(APCfit), BIC(APCfit)), 
                        RH = c(RHfit$npar[1], AIC(RHfit), BIC(RHfit)), 
                        M7 = c(M7fit$npar[1], AIC(M7fit), BIC(M7fit)), 
                        PLAT = c(PLATfit$npar[1], AIC(PLATfit), BIC(PLATfit))))

rownames(BICdf) <- c("Number of parameters", "AIC", "BIC")
AIC.rank <- rank(BICdf[2,])
BIC.rank <- rank(BICdf[3,])
temp <- BICdf
BICdf[2,] <- paste(round(temp[2,],0), "(",AIC.rank,")", sep = "")
BICdf[3,] <- paste(round(temp[3,],0), "(",BIC.rank,")", sep = "")
xtable(BICdf, dec = 1, caption = "Number of parameters, AIC and BIC values (with their respective rankings in brackets) for different model fitted to the England and Wales males population for ages 55-89 and the period 1961-2011.", center = "centering", file = "", floating = TRUE,label="tab:InfoCriteria",align="lcccccc", digits = 0)


###################################################
### code chunk number 33: forAll
###################################################
LCfor <- forecast(LCfit, h = 50)
CBDfor <- forecast(CBDfit, h = 50)
APCfor <- forecast(APCfit, h = 50, gc.order = c(1, 1, 0))
RHfor <- forecast(RHfit, h = 50, gc.order = c(1, 1, 0))
M7for <- forecast(M7fit, h = 50, gc.order = c(2, 0, 0))
PLATfor <- forecast(PLATfit, h = 50, gc.order = c(2, 0, 0))


###################################################
### code chunk number 34: forLCArima
###################################################
LCforArima <- forecast(LCfit, h = 50, kt.method = "iarima", 
  kt.order = c(1, 1, 2))


###################################################
### code chunk number 35: plotForecastPeriodIndexShow (eval = FALSE)
###################################################
## plot(LCfor, only.kt = TRUE)
## plot(LCforArima, only.kt = TRUE)
## plot(RHfor, only.kt = TRUE)
## plot(M7for, only.kt = TRUE, nCol = 3)
## plot(PLATfor, only.kt = TRUE)


###################################################
### code chunk number 36: plotForecastCohortIndexShow (eval = FALSE)
###################################################
## plot(APCfor, only.gc = TRUE)
## plot(RHfor, only.gc = TRUE)
## plot(M7for, only.gc = TRUE)
## plot(PLATfor, only.gc = TRUE)


###################################################
### code chunk number 37: plotForecastPeriodIndexRH
###################################################
plot(RHfor, only.kt = TRUE, lwd = 2)


###################################################
### code chunk number 38: plotForecastPeriodIndexPLAT
###################################################
plot(PLATfor, only.kt = TRUE, lwd = 2)


###################################################
### code chunk number 39: plotForecastPeriodIndexM7
###################################################
plot(M7for, only.kt = TRUE, nCol = 3, lwd = 2)


###################################################
### code chunk number 40: plotForecastLCRW
###################################################
plot(LCfor, only.kt = TRUE, lwd = 2)


###################################################
### code chunk number 41: plotForecastLCArima
###################################################
plot(LCforArima, only.kt = TRUE, lwd = 2)


###################################################
### code chunk number 42: plotForecastCohortIndexAPC
###################################################
plot(APCfor, only.gc = TRUE, lwd = 2)


###################################################
### code chunk number 43: plotForecastCohortIndexRH
###################################################
plot(RHfor, only.gc = TRUE, lwd = 2)


###################################################
### code chunk number 44: plotForecastCohortIndexM7
###################################################
plot(M7for, only.gc = TRUE, lwd = 2)


###################################################
### code chunk number 45: plotForecastCohortIndexPLAT
###################################################
plot(PLATfor, only.gc = TRUE, lwd = 2)


###################################################
### code chunk number 46: simAll
###################################################
set.seed(1234)
nsim <- 500
LCsim <- simulate(LCfit, nsim = nsim, h = 50)
CBDsim <- simulate(CBDfit, nsim = nsim, h = 50)
APCsim <- simulate(APCfit, nsim = nsim, h = 50, gc.order = c(1, 1, 0))
RHsim <- simulate(RHfit, nsim = nsim, h = 50, gc.order = c(1, 1, 0))
M7sim <- simulate(M7fit, nsim = nsim, h = 50, gc.order = c(2, 0, 0))
PLATsim <- simulate(PLATfit, nsim = nsim, h = 50, gc.order = c(2, 0, 0))


###################################################
### code chunk number 47: plotSimulationRH
###################################################
par(mfrow=c(1, 3))
plot(RHfit$years, RHfit$kt[1, ], xlim = range(RHfit$years, RHsim$kt.s$years),
  ylim = range(RHfit$kt, RHsim$kt.s$sim[1, , 1:20]),  type = "l",
  xlab = "year", ylab = "kt", main = "Period index")
matlines(RHsim$kt.s$years, RHsim$kt.s$sim[1, , 1:20], type = "l", lty = 1)
#Plot cohort index
plot(RHfit$cohorts, RHfit$gc, xlim = range(RHfit$cohorts, RHsim$gc.s$cohorts),
  ylim = range(RHfit$gc, RHsim$gc.s$sim[, 1:20], na.rm = TRUE), type = "l",
  xlab = "year", ylab = "kt", main = "Cohort index (ARIMA(1,1,0) with drift)")
matlines(RHsim$gc.s$cohorts, RHsim$gc.s$sim[, 1:20], type = "l", lty = 1)
#Plot rates at age 65
qxt <- EWMaleIniData$Dxt / EWMaleIniData$Ext
plot(RHfit$years, qxt["65", ], xlim = range(RHfit$years, RHsim$years), 
  ylim = range(qxt["65", ], RHsim$rates["65", , 1:20]), type = "l",
  xlab = "year", ylab = "rate", main = "Mortality rates at age 65")
matlines(RHsim$years, RHsim$rates["65", , 1:20], type = "l", lty = 1)


###################################################
### code chunk number 48: plotSimulationRHShow (eval = FALSE)
###################################################
## par(mfrow = c(1, 3))
## plot(RHfit$years, RHfit$kt[1, ], xlim = range(RHfit$years, 
##   RHsim$kt.s$years), ylim = range(RHfit$kt, RHsim$kt.s$sim[1, , 1:20]), 
##   type = "l", xlab = "year", ylab = "kt", main = "Period index")
## matlines(RHsim$kt.s$years, RHsim$kt.s$sim[1, , 1:20], type = "l", lty = 1)
## plot(RHfit$cohorts, RHfit$gc, xlim = range(RHfit$cohorts, 
##   RHsim$gc.s$cohorts), ylim = range(RHfit$gc, RHsim$gc.s$sim[, 1:20],
##   na.rm = TRUE), type = "l", xlab = "year", ylab = "kt",
##   main = "Cohort index (ARIMA(1,1,0) with drift)")
## matlines(RHsim$gc.s$cohorts, RHsim$gc.s$sim[, 1:20], type = "l", lty = 1)
## qxt <- Dxt / Ext
## plot(RHfit$years, qxt["65", ], xlim = range(RHfit$years, RHsim$years), 
##   ylim = range(qxt["65", ], RHsim$rates["65", , 1:20]), type = "l", 
##   xlab = "year", ylab = "rate", main = "Mortality rates at age 65")
## matlines(RHsim$years, RHsim$rates["65", , 1:20], type = "l", lty = 1)


###################################################
### code chunk number 49: plotLCfan
###################################################
library(fanplot)
probs = c(2.5, 10, 25, 50, 75, 90, 97.5)
qxt <- EWMaleIniData$Dxt/EWMaleIniData$Ext 
par(mar=c(4.5,4,1,1))
#age 65
plot(LCfit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(LCsim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(LCfit$years, qxt["75", ], pch = 20)
fan(t(LCsim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 75
points(LCfit$years, qxt["85",], pch = 20)
fan(t(LCsim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 50: plotCBDfan
###################################################
par(mar=c(4.5,4,1,1))
#age 65
plot(CBDfit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(CBDsim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(CBDfit$years, qxt["75", ], pch = 20)
fan(t(CBDsim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 75
points(CBDfit$years, qxt["85",], pch = 20)
fan(t(CBDsim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 51: plotAPCfan
###################################################
par(mar=c(4.5,4,1,1))
#age 65
plot(APCfit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(APCsim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(APCfit$years, qxt["75", ], pch = 20)
fan(t(APCsim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 75
points(APCfit$years, qxt["85",], pch = 20)
fan(t(APCsim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 52: plotRHfan
###################################################
par(mar=c(4.5,4,1,1))
#age 65
plot(RHfit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(RHsim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(RHfit$years, qxt["75", ], pch = 20)
fan(t(RHsim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 85
points(RHfit$years, qxt["85",], pch = 20)
fan(t(RHsim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 53: plotM7fan
###################################################
par(mar=c(4.5,4,1,1))
#age 65
plot(M7fit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(M7sim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(M7fit$years, qxt["75", ], pch = 20)
fan(t(M7sim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 85
points(M7fit$years, qxt["85",], pch = 20)
fan(t(M7sim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 54: plotPLATfan
###################################################
par(mar=c(4.5,4,1,1))
#age 65
plot(PLATfit$years, qxt["65", ], xlim = c(1960, 2061), ylim = c(0.0025,0.2),
     xlab = "year", ylab = "mortality rate (log scale)", pch = 20, log = "y")
fan(t(PLATsim$rates["65", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("black", "white")), ln = NULL)
#age 75
points(PLATfit$years, qxt["75", ], pch = 20)
fan(t(PLATsim$rates["75", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("red", "white")), ln = NULL)
#age 85
points(PLATfit$years, qxt["85",], pch = 20)
fan(t(PLATsim$rates["85", , ]), start = 2012,
    probs = probs, n.fan = 4,
    fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
#labels
text(1965, qxt[c("65","75", "85"),"1990"], labels=c("x=65", "x=75", "x=85"))


###################################################
### code chunk number 55: plotLCFanShow (eval = FALSE)
###################################################
## library("fanplot")
## probs = c(2.5, 10, 25, 50, 75, 90, 97.5)
## qxt <- Dxt / Ext 
## matplot(LCfit$years, t(qxt[c("65", "75", "85"), ]), 
##   xlim = c(1960, 2061), ylim = c(0.0025, 0.2), pch = 20, col = "black", 
##   log = "y", xlab = "year", ylab = "mortality rate (log scale)")
## fan(t(LCsim$rates["65", , ]), start = 2012, probs = probs, n.fan = 4,
##   fan.col = colorRampPalette(c("black", "white")), ln = NULL)
## fan(t(LCsim$rates["75", , ]), start = 2012, probs = probs, n.fan = 4,
##   fan.col = colorRampPalette(c("red", "white")), ln = NULL)
## fan(t(LCsim$rates["85", , ]), start = 2012, probs = probs, n.fan = 4,
##   fan.col = colorRampPalette(c("blue", "white")), ln = NULL)
## text(1965, qxt[c("65", "75", "85"), "1990"], 
##   labels = c("x = 65", "x = 75", "x = 85"))


###################################################
### code chunk number 56: plotLifetableShow (eval = FALSE)
###################################################
## plot(55:61, extractCohort(fitted(LCfit, type = "rates"), cohort = 1950), 
##   type = "l", log = "y", xlab = "age", ylab = "q(x)", 
##   main = "Mortality rates for the 1950 cohort", 
##   xlim = c(55,89), ylim = c(0.005, 0.12))
## lines(62:89, extractCohort(LCfor$rates, cohort = 1950), lty = 2)


###################################################
### code chunk number 57: plotLifetable
###################################################
plot(55:61, extractCohort(fitted(LCfit, type = "rates"), cohort = 1950), 
  type = "l", log = "y", xlab = "age", ylab = "q(x)", 
  main = "Mortality rates for the 1950 cohort", 
  xlim = c(55,89), ylim = c(0.005, 0.12))
lines(62:89, extractCohort(LCfor$rates, cohort = 1950), lty = 2)


###################################################
### code chunk number 58: loadNZ (eval = FALSE)
###################################################
## library("demography")
## NZdata <- hmd.mx(country = "NZL_NP", username = username,
##   password = password, label = "New Zealand")


###################################################
### code chunk number 59: transNZ (eval = FALSE)
###################################################
## NZStMoMo <- StMoMoData(NZdata, series = "male")


###################################################
### code chunk number 60: fitNZ (eval = FALSE)
###################################################
## LCfit_NZ <- fit(lc(), data = NZStMoMo, ages.fit = 0:89, 
##   years.fit = 1985:2008)


###################################################
### code chunk number 61: bootLCNZ (eval = FALSE)
###################################################
## LCboot_NZ <- bootstrap(LCfit_NZ, nBoot = 5000, type = "semiparametric")


###################################################
### code chunk number 62: PlotbootLCNZshow (eval = FALSE)
###################################################
## plot(LCboot_NZ, nCol = 3)


###################################################
### code chunk number 63: simPULCNZ (eval = FALSE)
###################################################
## LCsimPU_NZ <- simulate(LCboot_NZ,  h = 24)


###################################################
### code chunk number 64: simLCNZ (eval = FALSE)
###################################################
## LCfor_NZ <- forecast(LCfit_NZ, h = 24)
## LCsim_NZ <- simulate(LCfit_NZ, nsim = 5000, h = 24)


###################################################
### code chunk number 65: plotLCPredshow (eval = FALSE)
###################################################
## mxt <- LCfit_NZ$Dxt / LCfit_NZ$Ext
## mxtHat <- fitted(LCfit_NZ, type = "rates")           
## mxtCentral <- LCfor_NZ$rates
## mxtPred2.5 <- apply(LCsim_NZ$rates, c(1, 2), quantile, probs = 0.025)
## mxtPred97.5 <- apply(LCsim_NZ$rates, c(1, 2), quantile, probs = 0.975)
## mxtHatPU2.5 <- apply(LCsimPU_NZ$fitted, c(1, 2), quantile, probs = 0.025)  
## mxtHatPU97.5 <- apply(LCsimPU_NZ$fitted, c(1, 2), quantile, probs = 0.975)  
## mxtPredPU2.5 <- apply(LCsimPU_NZ$rates, c(1, 2), quantile, probs = 0.025)
## mxtPredPU97.5 <- apply(LCsimPU_NZ$rates, c(1, 2), quantile, probs = 0.975)
## x <- c("40", "60", "80")
## matplot(LCfit_NZ$years, t(mxt[x, ]), xlim = range(LCfit_NZ$years, 
##   LCfor_NZ$years), ylim = range(mxtHatPU97.5[x, ], mxtPredPU2.5[x, ],
##   mxt[x, ]), type = "p", xlab = "years",
##   ylab = "mortality rates (log scale)", log = "y", pch = 20,
##   col = "black")
## matlines(LCfit_NZ$years, t(mxtHat[x, ]), lty = 1, col = "black")
## matlines(LCfit_NZ$years, t(mxtHatPU2.5[x, ]), lty = 5, col = "red")
## matlines(LCfit_NZ$years, t(mxtHatPU97.5[x, ]), lty = 5, col = "red")
## matlines(LCfor_NZ$years, t(mxtCentral[x, ]), lty = 4, col = "black")
## matlines(LCsim_NZ$years, t(mxtPred2.5[x, ]), lty = 3, col = "black")
## matlines(LCsim_NZ$years, t(mxtPred97.5[x, ]), lty = 3, col = "black")
## matlines(LCsimPU_NZ$years, t(mxtPredPU2.5[x, ]), lty = 5, col = "red")
## matlines(LCsimPU_NZ$years, t(mxtPredPU97.5[x, ]), lty = 5, col = "red")
## text(1986, mxtHatPU2.5[x, "1995"], labels = c("x=40", "x=60", "x=80"))


