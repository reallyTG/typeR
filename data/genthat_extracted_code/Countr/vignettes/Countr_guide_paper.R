## This script was produced using Sweave and then manually commented.
##
## R code to reproduce the results from JSS paper
##   Flexible Regression Models for Count Data Based on Renewal Processes:
##   The \pkg{Countr} Package
## by Tarak Kharrat, Georgi N. Boshnakov, Ian McHale and Rose Baker
##
## Tested with Countr 3.5.1, Microsoft R Open 3.4.3 on ubuntu 16.06
##                           and R 3.5-0 on Windows
##
## This R-script is standalone and can be source()'ed in R.
##
## A conda environment 'r_countr_env' (see file 'countr.yml') is also provided:
## after installing anaconda (https://conda.io/docs/user-guide/install/index.html),
## you can run the following commands in your terminal:
##    conda env create -f environment.yml
##    source activate r_countr_env
## Then start R and source() this file.

###################################################
### code chunk number 1: load options
###################################################
## this chunk is always evaluated
op <- options()
options(prompt = "R> ", continue = "+  ", width = 77, useFancyQuotes = FALSE)
options(digits = 3)  # number of digits after decimal point
options(show.signif.stars=FALSE)

###################################################
### code chunk number 3: load libraries
###################################################
library("Countr")
library("lmtest")
library("dplyr")
library("xtable")


###################################################
### code chunk number 4: main function interface
###################################################
## renewalCount(formula, data, subset, na.action, weights, offset,
##   dist = c("weibull", "weibullgam", "custom", "gamma", "gengamma", "burr"),
##   anc = NULL, convPars = NULL, link = NULL, time = 1.0,
##   control = renewal.control(...), customPars = NULL,
##   seriesPars = NULL, weiMethod = NULL,
##   computeHessian = TRUE, model = TRUE, y = TRUE, x = FALSE, ...)


###################################################
### code chunk number 7: football data
###################################################
data("football")
table(football$awayTeamGoals)


###################################################
### code chunk number 8: models for away goals
###################################################
away_poiss <- glm(formula = awayTeamGoals ~ 1,
                  family = poisson,
                  data = football)
away_wei <- renewalCount(formula = awayTeamGoals ~ 1,
                         data = football,
                         dist = "weibull", computeHessian = FALSE,
                         control = renewal.control(trace = 0)
                         )

###################################################
### code chunk number 9:
###################################################
breaks_ <- 0:5
pears <- compareToGLM(poisson_model = away_poiss, breaks = breaks_,
                      weibull = away_wei)


###################################################
### code chunk number 10: frequency plot
###################################################
library("dplyr")
frequency_plot(pears$Counts, pears$Actual,
               dplyr::select(pears, contains("_predicted")),
               colours = c("grey", "blue", "green", recursive="black")
               )


###################################################
### code chunk number 11: LR test
###################################################
lr <- lmtest::lrtest(away_poiss, away_wei)


###################################################
### code chunk number 12: X2 test
###################################################
gof_wei <- chiSq_gof(away_wei, breaks = breaks_)
gof_pois <- chiSq_gof(away_poiss, breaks = breaks_)
rbind(Poisson = gof_pois, "Weibull-count" = gof_wei)


###################################################
### code chunk number 13: fertility data
###################################################
data("fertility", package = "Countr")


###################################################
### code chunk number 14: head-fertility
###################################################
dataCaption <- "First few rows of fertility data."
print(xtable(head(fertility), caption = dataCaption, label = "tbl:data"),
      rotate.colnames = TRUE)


###################################################
### code chunk number 15: children-table
###################################################
freqtable <-
    count_table(count = fertility$children, breaks = 0:9, formatChar = TRUE)
print(xtable(freqtable, caption = "Fertility data: Frequency distribution of column \\texttt{children}.",
             label = "tbl:freq"))


###################################################
### code chunk number 16: fertility data processing
###################################################
nam_fac <- sapply(fertility, function(x) !is.numeric(x))
fert_factor <- summary(fertility[ , nam_fac])
fert_num <- t(sapply(fertility[ , !nam_fac], summary)) # summary(fertility[ , !nam_fac])


###################################################
### code chunk number 17: covariates-table
###################################################
print(xtable(fert_factor,
             caption = "Summary of the factor variables",
             label = "tbl:frecfac")
      )


###################################################
### code chunk number 18: covariates-table-num
###################################################
print(xtable(fert_num,
             caption = "Summary of the numeric explanatory variables",
             label = "tbl:frecnum"))


###################################################
### code chunk number 19: main model
###################################################
regModel <- children ~ german + years_school + voc_train + university +
  religion + rural + year_birth + age_marriage


###################################################
### code chunk number 20: link functions
###################################################
link_weibull <- list(scale = "log", shape = "log")


###################################################
### code chunk number 21: gamma model--fertility data
###################################################
gamModel <- renewalCount(formula = regModel, data = fertility,
                         dist = "gamma",
                         control = renewal.control(trace = 0)
                         )


###################################################
### code chunk number 22: visualise parameters name: weibull
###################################################
getParNames("weibull")


###################################################
### code chunk number 23: visualise parameters name: gamma
###################################################
renewalNames(regModel, data = fertility, dist = "gamma")


###################################################
### code chunk number 24: Poisson initial values
###################################################
IV <- glm(regModel, family = poisson(), data = fertility)


###################################################
### code chunk number 25: print initial values
###################################################
coef(IV)


###################################################
### code chunk number 26: prepare initial values
###################################################
startW <- renewalCoef(IV, target = "scale")


###################################################
### code chunk number 27:
###################################################
startW <- c(startW, "shape_" = log(1))
startW


###################################################
### code chunk number 28: weibull model with initial values
###################################################
weiModel <- renewalCount(formula = regModel, data = fertility,
                         dist = "weibull",
                         control = renewal.control(trace = 0, start = startW))


###################################################
### code chunk number 29: change the optim algo to L-BFGS-B
###################################################
weiModelA <- renewalCount(formula = regModel, data = fertility,
  dist = "weibull",
  control = renewal.control(trace = 0, method = "L-BFGS-B"))


###################################################
### code chunk number 30: try few optim algo
###################################################
weiModel_many <-
    renewalCount(formula = regModel, data = fertility,
                 dist = "weibull",
                 control = renewal.control(trace = 0,
                                           method = c("nlminb", "Nelder-Mead",
                                                      "BFGS")
                                           )
                 )

###################################################
### code chunk number 31: compare their performance
###################################################
t(weiModel_many$optim)


###################################################
### code chunk number 32: prepare a formula with CountrFormula
###################################################
CountrFormula(y ~ x1 + x2 + x3, shape = ~x1)


###################################################
### code chunk number 33: anc formula
###################################################
anc <- list(sigma = regModel, Q = regModel)


###################################################
### code chunk number 34: starting values with anc
###################################################
startA <- renewalCoef(IV, target = "gengamma")
startA[c("Q_", "sigma_")] <- c(1, log(1))
startA


###################################################
### code chunk number 35: fit the gen gamma model with anc
###################################################
gengamModel_ext0 <- renewalCount(formula = regModel, data = fertility,
                                 dist = "gengamma", anc = anc,
                                 control = renewal.control(start = startA,
                                                           trace = 0),
                                 computeHessian = FALSE)


###################################################
### code chunk number 36: alternative models for anc parameters
###################################################
sigmaModel <- ~ german + university + religion + age_marriage
QModel     <- ~ german + religion + age_marriage


###################################################
### code chunk number 37:
###################################################
anc <- list(sigma = sigmaModel, Q = QModel)


###################################################
### code chunk number 38:
###################################################
regModelSQ <- Formula::as.Formula(regModel, sigmaModel, QModel)


###################################################
### code chunk number 39:
###################################################
CountrFormula(regModel, sigma = sigmaModel, Q = QModel)


###################################################
### code chunk number 40: initial values for new anc models
###################################################
IV2 <- glm(update(sigmaModel, children ~ .),
           family = poisson(), data = fertility)
IV3 <- glm(update(QModel, children ~ .),
           family = poisson(), data = fertility)


###################################################
### code chunk number 41:
###################################################
startGG <- c(renewalCoef(IV, target = "mu"),
             renewalCoef(IV2, target = "sigma"),
             renewalCoef(IV3, target = "Q"))
startGG


###################################################
### code chunk number 42: fit the new models
###################################################
fm_gengamAnc <- renewalCount(formula = regModel, data = fertility,
                             dist = "gengamma", anc = anc,
                             control = renewal.control(start = startGG,
                                                       trace = 0),
                             computeHessian = FALSE)


###################################################
### code chunk number 43:
###################################################
fm_gengam <- renewalCount(formula = regModelSQ, data = fertility,
                          dist = "gengamma",
                          control = renewal.control(start = startGG,
                                                    trace = 0),
                          computeHessian = FALSE)


###################################################
### code chunk number 44: refit model with previously obtained IV
###################################################
startBB <- coef(fm_gengam)
fm_gengam_ext <- renewalCount(formula = regModelSQ, data = fertility,
                              dist = "gengamma",
                              control = renewal.control(method = "spg",
                                                        start = startBB,
                                                        trace = 0),
                              computeHessian = FALSE )


###################################################
### code chunk number 45: check convergence status
###################################################
fm_gengam_ext$converged


###################################################
### code chunk number 46: link functions
###################################################
parNames <- c("scale", "shape")
sWei <- function(tt, distP) exp( -distP[["scale"]] * tt ^ distP[["shape"]])
link <- list(scale = "log", shape = "log")


###################################################
### code chunk number 47:
###################################################
control_custom <- renewal.control(start = startW, trace = 0)


###################################################
### code chunk number 48:
###################################################
.getExtrapol <- function(distP) {
    c(2, distP[["shape"]])
}


###################################################
### code chunk number 49:
###################################################
customPars <- list(parNames = parNames, survivalFct = sWei,
                   extrapolFct = .getExtrapol)


###################################################
### code chunk number 50: user passed inter-arrival time model
###################################################
weiModelCust <- renewalCount(formula = regModel, data = fertility,
                             dist = "custom", link = link,
                             control = control_custom,
                             customPars = customPars,
                             computeHessian = FALSE)


###################################################
### code chunk number 51:
###################################################
summary(gamModel)

###################################################
### code chunk number 52:
###################################################
summary(weiModel)


###################################################
### code chunk number 53: bootsrap
###################################################
se_boot <- se.coef(object = weiModel, type =  "boot", R = 5)
confint_boot <- confint(object = weiModel, type = "boot", R = 5)


###################################################
### code chunk number 54: prepare data for prediction
###################################################
newData <- head(fertility)


###################################################
### code chunk number 55: perform predictions
###################################################
predNew.response <- predict(weiModel, newdata = newData,
                            type = "response",
                            se.fit = TRUE)
predNew.prob <- predict(weiModel, newdata = newData, type = "prob",
                        se.fit = TRUE)

###################################################
### code chunk number 56:
###################################################
options(digits = 5)


###################################################
### code chunk number 57
###################################################
predtable <- data.frame(newData$children, predNew.prob$values,
                        predNew.response$values)
names(predtable) <- c("Y", "P(Y=y|x)", "E(Y|x)")
predtable


###################################################
### code chunk number 58
###################################################
options(digits = 3)


###################################################
### code chunk number 59
###################################################
cbind(builtIn = coef(weiModel), user = coef(weiModelCust))


###################################################
### code chunk number 60: load-data
###################################################
data("quine", package = "MASS")


###################################################
### code chunk number 61: children-table
###################################################
breaks_ <- c(0, 1, 3, 5:7, 9, 12, 15, 17, 23, 27, 32)
freqtable <-
    count_table(count = quine$Days, breaks = breaks_, formatChar = TRUE)


###################################################
### code chunk number 62
###################################################
 print(xtable(freqtable[ , 1:7]), floating = FALSE, only.contents = TRUE)
 cat("\n\\\\[5pt]\n")
 print(xtable(freqtable[ , -(1:7)]), floating = FALSE, only.contents = TRUE)



###################################################
### code chunk number 63: quine data models
###################################################
quine_form <- as.formula(Days ~ Eth + Sex + Age + Lrn)
pois <- glm(quine_form, family = poisson(), data = quine)
nb <- MASS::glm.nb(quine_form, data = quine)

## various renewal models
wei <- renewalCount(formula = quine_form, data = quine, dist = "weibull",
                    computeHessian = FALSE, weiMethod = "conv_dePril",
                    control = renewal.control(trace = 0))

gam <- renewalCount(formula = quine_form, data = quine, dist = "gamma",
                    computeHessian = FALSE,
                    control = renewal.control(trace = 0))

gengam <- renewalCount(formula = quine_form, data = quine, dist = "gengamma",
                       computeHessian = FALSE,
                       control = renewal.control(trace = 0))


###################################################
### code chunk number 64: lr-test-poisson
###################################################
library("lmtest")
pois_nb <- lrtest(pois, nb)
pois_wei <- suppressWarnings(lrtest(pois, wei))
pois_gam <- suppressWarnings(lrtest(pois, gam))
pois_gengam <- suppressWarnings(lrtest(pois, gengam))
pois_res <- data.frame("Alternative model" =
                           c("negative-binomial", "weibull", "gamma",
                             "generalised-gamma"),
                       Chisq = c(pois_nb$Chisq[2], pois_wei$Chisq[2],
                                 pois_gam$Chisq[2], pois_gengam$Chisq[2]),
                       Df = c(1, 1, 1, 2),
                       Critical_value = c(rep(qchisq(0.95, 1), 3), qchisq(0.95, 2)),
                       stringsAsFactors = FALSE)


###################################################
### code chunk number 65:
###################################################
print(xtable(pois_res, caption = "LR results against Poisson model. Each row compares an alternative model vs the Poisson model. All alternatives are preferable to Poisson.
The critical value corresponds to a significance level of 5\\%",
             label = "tab:lr_pois"))


###################################################
### code chunk number 66: lr-test-renewal
###################################################
gengam_wei <- lrtest(wei, gengam)
gengam_gam <- lrtest(gam, gengam)
gengam_res <- data.frame(Model = c("weibull", "gamma"),
  Chisq = c(gengam_wei$Chisq[2], gengam_gam$Chisq[2]), Df = 1,
  Critical_value = rep(qchisq(0.95, 1), 2), stringsAsFactors = FALSE)


###################################################
### code chunk number 67:
###################################################
print(xtable(gengam_res, caption = "LR results against generalised-gamma model",
             label = "tab:lr_gengam"))


###################################################
### code chunk number 68: AIC-models
###################################################
ic <- data.frame(Model = c("gamma", "weibull", "negative-binomial",
                           "generalised-gamma", "Poisson"),
                 AIC = c(AIC(gam), AIC(wei), AIC(nb), AIC(gengam), AIC(pois)),
                 BIC = c(BIC(gam), BIC(wei), BIC(nb), BIC(gengam), BIC(pois)),
		 stringsAsFactors = FALSE)


###################################################
### code chunk number 69: table of AIC results
###################################################
print(xtable(ic,
             caption = "Information criteria results",
             label = "tab:ic_models"),
      hline.after = c(0, 3), type = "latex"
	     )


###################################################
### code chunk number 70: goodness of fit
###################################################
gof <- chiSq_gof(gam, breaks = breaks_)
gof


###################################################
### code chunk number 71: restore options
###################################################
options(op) # restore options

