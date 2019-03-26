## ----setup, echo = 1-----------------------------------------------------
library(reda)
knitr::opts_chunk$set(fig.height = 5, fig.width = 7)

## ----data----------------------------------------------------------------
head(simuDat)
str(simuDat)

## ----sampleMcf-----------------------------------------------------------
## Example 1. valve-seat data
valveMcf0 <- mcf(Survr(ID, Days, No.) ~ 1, data = valveSeats)

## Example 2. the simulated data
simuMcf <- mcf(Survr(ID, time, event) ~ group + gender,
               data = simuDat, subset = ID %in% 1 : 50)

## ----plot:sampleMcf------------------------------------------------------
## overall sample MCF for valve-seat data in Nelson (1995)
plot(valveMcf0, conf.int = TRUE, mark.time = TRUE, addOrigin = TRUE, col = 2) +
    ggplot2::xlab("Days") + ggplot2::theme_bw()

## sample MCF for different groups (the default theme)
plot(simuMcf, conf.int = TRUE, lty = 1 : 4, legendName = "Treatment & Gender")

## ----plot:mcfSE----------------------------------------------------------
## Poisson process method
valveMcf1 <- mcf(Survr(ID, Days, No.) ~ 1, valveSeats, variance = "Poisson")

## bootstrap method (with 1,000 bootstrap samples)
set.seed(123)
valveMcf2 <- mcf(Survr(ID, Days, No.) ~ 1, valveSeats,
                 variance = "bootstrap", control = list(B = 1e3))

## comparing the standard error estimates
library(ggplot2)
ciDat <- rbind(cbind(valveMcf0@MCF, Method = "Lawless & Nadeau"),
               cbind(valveMcf1@MCF, Method = "Poisson"),
               cbind(valveMcf2@MCF, Method = "Bootstrap"))
ggplot(ciDat, aes(x = time, y = se)) +
    geom_step(aes(color = Method, linetype = Method)) +
    xlab("Days") + ylab("SE estimates") + theme_bw()

## ----plot:mcfCI----------------------------------------------------------
## comparing the confidence intervals
ggplot(ciDat, aes(x = time)) +
    geom_step(aes(y = MCF), color = "grey") +
    geom_step(aes(y = lower, color = Method, linetype = Method)) +
    geom_step(aes(y = upper, color = Method, linetype = Method)) +
    xlab("Days") + ylab("Confidence intervals") + theme_bw()

## ----mcfDiff1------------------------------------------------------------
## one sample MCF object of two groups
mcf0 <- mcf(Survr(ID, time, event) ~ group, data = simuDat)
(mcf_diff0 <- mcfDiff(mcf0))

## ----mcfDiff2------------------------------------------------------------
## explicitly ask for the difference of two sample MCF
mcf1 <- mcf(Survr(ID, time, event) ~ 1, simuDat, group %in% "Contr")
mcf2 <- mcf(Survr(ID, time, event) ~ 1, simuDat, group %in% "Treat")
mcf1 - mcf2

## ----plot:mcfDiff--------------------------------------------------------
plot(mcf_diff0)

## ----const---------------------------------------------------------------
(constFit <- rateReg(Survr(ID, time, event) ~ group + x1, data = simuDat))

## ----twoPieces-----------------------------------------------------------
# two pieces' constant rate function
(twoPiecesFit <- rateReg(Survr(ID, time, event) ~ group + x1, df = 2,
                         data = simuDat, subset = ID %in% 1:50))

## ----sixPieces-----------------------------------------------------------
(piecesFit <- rateReg(Survr(ID, time, event) ~ group + x1, data = simuDat,
                      knots = seq(from = 28, to = 140, by = 28)))

## ----spline--------------------------------------------------------------
## internal knots are set as 33% and 67% quantiles of time variable
(splineFit <- rateReg(Survr(ID, time, event) ~ group + x1, data = simuDat,
                      df = 6, degree = 3, spline = "mSplines"))
## or internal knots are expicitly specified
(splineFit <- rateReg(Survr(ID, time, event) ~ group + x1, data = simuDat,
                      spline = "bSp", degree = 3L, knots = c(56, 112)))

## ----summary-------------------------------------------------------------
summary(constFit)
summary(piecesFit, showCall = FALSE)
summary(splineFit, showCall = FALSE, showKnots = FALSE)

## ----est-----------------------------------------------------------------
## point estimates of covariate coefficients
coef(splineFit)
## confidence interval for covariate coefficients
confint(splineFit, level = 0.95)

## ----modelSelect---------------------------------------------------------
AIC(constFit, piecesFit, splineFit)
BIC(constFit, piecesFit, splineFit)

## ----baseRate------------------------------------------------------------
baseRateObj <- baseRate(splineFit)
plot(baseRateObj, conf.int = TRUE)

## ----piecesMcf-----------------------------------------------------------
piecesMcf <- mcf(piecesFit)
plot(piecesMcf, conf.int = TRUE, col = "blueviolet") + xlab("Days")

## ----splineMcf-----------------------------------------------------------
newDat <- data.frame(x1 = c(0, 0), group = c("Treat", "Contr"))
estmcf <- mcf(splineFit, newdata = newDat, groupName = "Group",
              groupLevels = c("Treatment", "Control"))
plot(estmcf, conf.int = TRUE, col = c("royalblue", "red"), lty = c(1, 5)) +
    ggtitle("Control vs. Treatment") + xlab("Days")

## ----plot:ribbon---------------------------------------------------------
plot(estmcf) +
    geom_ribbon(data = estmcf@MCF, alpha = 0.2,
                aes(x = time, ymin = lower, ymax = upper, fill = Group)) +
    ggtitle("Control vs. Treatment") + xlab("Days")

