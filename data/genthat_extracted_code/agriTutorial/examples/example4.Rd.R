library(agriTutorial)


### Name: example4
### Title: Example 4: One qualitative treatment factor with repeated
###   measurements over time.
### Aliases: example4

### ** Examples


## *************************************************************************************
##                       How to run the code
## *************************************************************************************

## Either type example("example4") to run ALL the examples succesively
## or copy and paste examples sucessively, as required

## *************************************************************************************
##                          Options and required packages
## *************************************************************************************

options(contrasts = c('contr.treatment','contr.poly'))
require(nlme)

## *************************************************************************************
##            Section 1:  Polynomials for weeks and blocks contrasts
## *************************************************************************************

sorghum$rawWeeks = poly(sorghum$varweek, degree = 4, raw = TRUE)
sorghum$polWeeks = poly(sorghum$varweek, degree = 4, raw = FALSE)
sorghum$polBlocks = poly(sorghum$varblock, degree = 4, raw = FALSE)
sorghum$factblock = factor(sorghum$varblock)

## *************************************************************************************
## Section 2: Various correlation models assuming full factorial blocks and weeks model
## *************************************************************************************

AIC = NULL
logLik = NULL
Model = c("ID", "CS", "AR(1)", "AR(1) + nugget", "UN")

## independent uncorrelated random plots
full_indy = gls(y ~ factweek * (Replicate + variety), sorghum)
anova(full_indy)
AIC = c(AIC, AIC(full_indy))
logLik = c(logLik, logLik(full_indy))

## corCompSymm compound symmetry
corCompSymm = gls(y ~ factweek * (Replicate + variety),
corr = corCompSymm(form = ~ varweek|factplot), sorghum)
anova(corCompSymm)
AIC = c(AIC, AIC(corCompSymm))
logLik = c(logLik, logLik(corCompSymm))
Variogram(corCompSymm)

## corExp without nugget
corExp = gls(y ~ factweek * (Replicate + variety),
 corr = corExp(form = ~ varweek|factplot), sorghum)
anova(corExp)
AIC = c(AIC, AIC(corExp))
logLik = c(logLik, logLik(corExp))
Variogram(corExp)

##  corExp with nugget
corExp_nugget = gls(y ~ factweek * (Replicate + variety),
 corr = corExp(form = ~ varweek|factplot, nugget = TRUE), sorghum)
anova(corExp_nugget)
AIC = c(AIC, AIC(corExp_nugget))
logLik = c(logLik, logLik(corExp_nugget))
Variogram(corExp)

##  corSymm unstructured
corSymm = gls(y ~ factweek * (Replicate + variety), corr = corSymm(form = ~ 1|factplot),
 weights = varIdent(form = ~ 1|varweek), sorghum)
anova(corSymm)
AIC = c(AIC, AIC(corSymm))
logLik = c(logLik, logLik(corSymm))
Variogram(corSymm)

##  Table 11 Comparison of log Likelihood and AIC statistics for different correlation structures
dAIC = AIC - AIC[4]
logLik = -2 * logLik
dlogLik = logLik - logLik[4]
AICtable = data.frame(Model, round(logLik, 2), round(dlogLik, 2), round(AIC, 2), round(dAIC, 2))
colnames(AICtable) = c("Covar_Model", "-2logLr", "-diff2logLr", "AIC", "diffAIC")
AICtable

## *************************************************************************************
##  Section 3: Factorial block and variety effects assuming full polynomial week effects
## *************************************************************************************

## Table A2 (cf Table 14) Sequential Wald tests for full model sorghum data
pol_Wald =
gls(y ~ (factblock+variety) * (rawWeeks[,1] + rawWeeks[,2] + polWeeks[,3] + polWeeks[,4]),
corr = corExp(form = ~ varweek | factplot, nugget = TRUE), sorghum)
anova(pol_Wald)
range=coef(pol_Wald$modelStruct$corStruct,unconstrained=FALSE)[1]
nugget=coef(pol_Wald$modelStruct$corStruct,unconstrained=FALSE)[2]
rho=(1-nugget)*exp(-1/range)
cat("Range =", range, "\n")
cat("Nugget =", nugget, "\n")
cat("Correlation =", rho, "\n")
ACF(pol_Wald)
plot(pol_Wald,sub.caption = NA, main = "Residuals from full polynomial weeks model")

## *************************************************************************************
## Section 4: Degree-2 model for weeks-by-variety and weeks-by-blocks effects assuming
## degree-3 and degree-4 week effects are zero
## *************************************************************************************

 ## Table 15 coefficients assuming a quadratic weeks model for both block and treatment effects
quad_Wald = gls(y ~  polBlocks + variety + rawWeeks[,1] + rawWeeks[,2] +
 polBlocks:(rawWeeks[,1] + rawWeeks[,2]+ polWeeks[,3] + polWeeks[,4]) +
 variety:(rawWeeks[,1] + rawWeeks[,2]),
 corr = corExp(form = ~ varweek | factplot, nugget=TRUE), sorghum)
anova(quad_Wald)
summary(quad_Wald)$tTable
vcov(quad_Wald)
range=coef(quad_Wald$modelStruct$corStruct,unconstrained=FALSE)[1]
nugget=coef(quad_Wald$modelStruct$corStruct,unconstrained=FALSE)[2]
rho=(1-nugget)*exp(-1/range)
cat("Range =", range, "\n")
cat("Nugget =", nugget, "\n")
cat("Correlation =", rho, "\n")
plot(quad_Wald,sub.caption = NA, main = "Residuals from quadratic regression model")

## *************************************************************************************
## Section 5: Quadratic model for weeks-by-variety effects assuming full degree-4 model
## for weeks and weeks-by-blocks effects
## *************************************************************************************

##  Model assuming a quadratic variety-by-weeks model and quartic blocks-by-weeks model
quad_Wald = gls(y ~ Replicate * (rawWeeks[,1] + rawWeeks[,2] + polWeeks[,3] + polWeeks[,4]) +
 variety * (rawWeeks[,1] + rawWeeks[,2]),
 corr = corExp(form = ~ varweek | factplot, nugget = TRUE), sorghum)
anova(quad_Wald)
summary(quad_Wald)$tTable
range=coef(quad_Wald$modelStruct$corStruct,unconstrained=FALSE)[1]
nugget=coef(quad_Wald$modelStruct$corStruct,unconstrained=FALSE)[2]
rho=(1-nugget)*exp(-1/range)
cat("Range =", range, "\n")
cat("Nugget =", nugget, "\n")
cat("Correlation =", rho, "\n")
plot(quad_Wald,sub.caption = NA, main = "Quadratic treatment-by-weeks model with full
blocks-by-weeks model")





