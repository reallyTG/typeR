library(agriTutorial)


### Name: example3
### Title: Example 3: Polynomial regression model with two quantitative
###   level treatment factors
### Aliases: example3

### ** Examples


## *************************************************************************************
##                       How to run the code
## *************************************************************************************

## Either type example("example3") to run ALL the examples succesively
## or copy and paste examples sucessively, as required

## *************************************************************************************
##                  Options and required packages
## *************************************************************************************

require(lmerTest)
require(lattice)
require(pbkrtest)
options(contrasts = c('contr.treatment', 'contr.poly'))

## *************************************************************************************
##            Section 1: Polynomial powers of N and W
## *************************************************************************************

greenrice$loguptake = log(greenrice$uptake)
greenrice$Nitrogen = factor(greenrice$N)
greenrice$Water = factor(greenrice$W)
PolW = poly((greenrice$W/10), degree = 2, raw = TRUE)
colnames(PolW) = c("Linear_W", "Quadratic_W")
PolN = poly((greenrice$N/100), degree = 2, raw = TRUE)
colnames(PolN) = c("Linear_N", "Quadratic_N")
greenrice = cbind(greenrice, PolW, PolN)

## residual plot of untransformed N uptake data
greenrice.uptake = lmer(uptake ~ Replicate + factor(N) * factor(W) +
 (1|Replicate:Main), data = greenrice)
plot(greenrice.uptake, main = "Pearson residual plot for untransformed N uptake",
 ylab = "Residuals N uptake")

## residual plot of log transformed N uptake data
greenrice.loguptake = lmer(loguptake ~ Replicate + factor(N) * factor(W) +
 (1|Replicate:Main), data = greenrice)
plot(greenrice.loguptake, main = "Pearson residual plot for log transformed N uptake",
 ylab = "Residuals log N uptake")
## No test: 
## Table 9: first-order model of log uptake with Wald tests
greenrice.lmer1 = lmer(loguptake ~ Linear_N + Linear_W + Nitrogen * Water +
 (1|Replicate) + (1|Replicate:Main), data = greenrice)
anova(greenrice.lmer1, ddf = "Kenward-Roger", type = 1)

## Table 10: second-order model of log uptake with Wald tests
greenrice.lmer2 = lmer(loguptake ~ Linear_N * Linear_W + Quadratic_N + Quadratic_W +
 Nitrogen * Water + (1|Replicate) + (1|Replicate:Main), data = greenrice)
anova(greenrice.lmer2, ddf = "Kenward-Roger", type = 1)
## End(No test)
## *************************************************************************************
##         Section 2 : Fitted regression models and quadratic log uptake curves
## *************************************************************************************
## No test: 
## Regression coefficients of quadratic response model of W and N
greenrice.lmer0 = lmer(loguptake ~ Linear_N * Linear_W + Quadratic_N +
 Quadratic_W + (1|Replicate) + (1|Replicate:Main), data = greenrice)
summary(greenrice.lmer0, ddf = "Kenward-Roger", type = 1)
## End(No test)

## Fig 4a fitted quadratic loguptake curve versus water stress treatments
panel.plot = function(x, y) {
panel.xyplot(x, y) # shows observed points
Nitrogen = c(0, .90, 1.80, 2.70)[panel.number()]
panel.curve(-1.16 + 0.17603 * x - 0.11599 * x * x + 0.68 * Nitrogen -
 0.0938 * Nitrogen * Nitrogen - 0.09072 * x * Nitrogen,
from = 0, to = 4.0, type = "l", lwd = 2)
}
xyplot(loguptake ~ Linear_W|factor(Linear_N), data = greenrice,
 scales = list(x = list(at = c(0, 1, 2, 4), labels = c(0, 10, 20, 40))),
 main = "Fig 4a: logN uptake versus water stress",
 xlab = " Water stress (days)", ylab = "Log nitrogen uptake (g/pot)",
 strip = strip.custom(strip.names = TRUE,
 factor.levels = c("0", "90", "180", "270")),
panel = panel.plot)

## Fig 4b fitted quadratic quadratic loguptake curve versus nitrogen rate treatments
panel.plot = function(x, y) {
panel.xyplot(x, y) # shows observed points
Water = c(0, 1.0, 2.0, 4.0)[panel.number()]
panel.curve( -1.16 + 0.17603 * Water - 0.11599 * Water * Water +
 0.68 * x - 0.0938 * x * x - 0.09072 * Water * x ,
from = 0, to = 2.70, type = "l", lwd = 2)
}
xyplot(loguptake ~ Linear_N|factor(Linear_W), data = greenrice,
 scales = list(x = list(at = c(0, .9, 1.8, 2.7), labels = c(0, 90, 180, 270))),
 main = "Fig 4b: logN uptake versus nitrogen rate",
 xlab = "Nitrogen (kg/ha)", ylab = "Log nitrogen uptake (g/pot)",
 strip = strip.custom(strip.names = TRUE,
 factor.levels = c("0", "10", "20", "40")),
panel = panel.plot)



## Fig 4a backtransformed quadratic loguptake curve versus water stress treatments
panel.plot = function(x, y) {
panel.xyplot(x, y) # shows observed points
Nitrogen = c(0, .90, 1.80, 2.70)[panel.number()]
panel.curve( exp(-1.16 + 0.17603 * x - 0.11599 * x * x + 0.68 * Nitrogen -
 0.0938 * Nitrogen * Nitrogen - 0.09072 * x * Nitrogen),
from = 0, to = 4.0, type = "l", lwd = 2)
}

xyplot(uptake ~ Linear_W|factor(Linear_N), data = greenrice,
 scales = list(x = list(at = c(0, 1, 2, 4), labels = c(0, 10, 20, 40))),
 main = "Fig 4a: Back transformed N uptake versus water stress",
 xlab = " Water stress (days)", ylab = "Nitrogen uptake (g/pot)",
 strip = strip.custom(strip.names = TRUE,
 factor.levels = c("0", "90", "180", "270")),
panel = panel.plot)

## Fig 4b back transformed quadratic loguptake curve versus nitrogen rate treatments
panel.plot = function(x, y) {
panel.xyplot(x, y) # shows observed points
Water = c(0, 1.0, 2.0, 4.0)[panel.number()]
panel.curve(exp(-1.16 + 0.17603 * Water - 0.11599 * Water * Water +
 0.68 * x - 0.0938 * x * x - 0.09072 * Water * x),
from = 0, to = 2.70, type = "l", lwd = 2)
}
xyplot(uptake ~ Linear_N|factor(Linear_W), data = greenrice,
 scales = list(x = list(at = c(0, .9, 1.8, 2.7), labels = c(0, 90, 180, 270))),
 main = "Fig 4b: Back transformed N uptake versus nitrogen rate",
 xlab = "Nitrogen (kg/ha)", ylab = "Nitrogen uptake (g/pot)",
 strip = strip.custom(strip.names = TRUE,
 factor.levels = c("0", "10", "20", "40")),
panel = panel.plot)






