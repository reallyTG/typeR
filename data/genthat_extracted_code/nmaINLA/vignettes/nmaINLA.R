## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(fig.path = 'plots/p')

## ----LOADINLA, echo=FALSE, eval=TRUE, warning=FALSE, message=FALSE-------
if (require('INLA')) {
require(nmaINLA)
data("Smokdat", package = "nmaINLA")
## ----creatdat, echo=TRUE, eval=TRUE, out.width=75------------------------
SmokdatINLA <- create_INLA_dat(dat = Smokdat,
                               armVars = c('treatment' = 't', 'responders' = 'r',
                                           'sampleSize' = 'n'),
                               nArmsVar = 'na',
                               design = 'des')

## ----NMAcons, echo=TRUE, eval=TRUE---------------------------------------
fit.consistency <- nma_inla(SmokdatINLA, likelihood = "binomial",
                            fixed.par = c(0, 1000), tau.prior = "uniform",
                            tau.par = c(0, 5), type = "consistency")
## ----NMjack, echo=TRUE, eval=TRUE----------------------------------------
fit.jackson <- nma_inla(SmokdatINLA, likelihood = "binomial",
                        fixed.par = c(0, 1000), tau.prior = "uniform",
                        tau.par = c(0, 5), kappa.prior = "uniform",
                        kappa.par = c(0, 5), type = "jackson")

## ----Strokedata, echo=TRUE, eval=TRUE------------------------------------
data("Strokedat", package = "nmaINLA")
# deleting 13th study
Strokedat.mreg <- Strokedat[-c(13),]
# centering the covariate
Strokedat.mreg$age <- Strokedat.mreg$age - mean(Strokedat.mreg$age)
# data preparation for INLA
StrokedatINLA.mreg <- create_INLA_dat(dat = Strokedat.mreg,
                                      armVars = c('treatment' = 't','responders' = 'r',
                                                  'sampleSize' = 'n'),
                                      nArmsVar = 'na',
                                      design = 'des',
                                      covariate = 'age')

## ----NMAreg, echo=TRUE, eval=TRUE----------------------------------------
fit.Stroke.CONS.MREG.INLA <- nma_inla(StrokedatINLA.mreg, likelihood = "binomial",
                                      fixed.par = c(0, 1000), tau.prior = "uniform",
                                      tau.par = c(0, 2), type = 'consistency',
                                      mreg = TRUE)


}


## ----InstallINLA, echo=TRUE, eval=FALSE----------------------------------
#  install.packages("INLA", repos=c(getOption("repos"),
#                                   INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)
#  library(INLA)

## ----InstallnmaINLA, echo=TRUE, eval=FALSE-------------------------------
#  install.packages("devtools")
#  library(devtools)
#  install_github("gunhanb/nmaINLA")

## ----Smokdat, echo=TRUE, eval=TRUE---------------------------------------
library(nmaINLA)
data("Smokdat", package = "nmaINLA")
head(Smokdat)

## ----creatdat, echo=TRUE, eval=TRUE, out.width=75------------------------
SmokdatINLA <- create_INLA_dat(dat = Smokdat,
                               armVars = c('treatment' = 't', 'responders' = 'r',
                                           'sampleSize' = 'n'),
                               nArmsVar = 'na',
                               design = 'des')
head(SmokdatINLA)

## ----Plotdat, echo=TRUE, eval=FALSE--------------------------------------
#  plot_nma(s.id = study, t.id = treatment, data = SmokdatINLA)

## ----Plotdat2, echo=FALSE------------------------------------------------
plot_nma(s.id = study, t.id = treatment, data = SmokdatINLA)

## ----NMAcons, echo=TRUE, eval=FALSE--------------------------------------
#  fit.consistency <- nma_inla(SmokdatINLA, likelihood = "binomial",
#                              fixed.par = c(0, 1000), tau.prior = "uniform",
#                              tau.par = c(0, 5), type = "consistency")

## ----NMAprint, echo=FALSE, eval=TRUE, results=TRUE, message=FALSE, error=FALSE,warning=FALSE----
if (require('INLA')) {
  require(nmaINLA)
  print(fit.consistency)
}

## ----NMAbasicPlot, echo=TRUE, eval=FALSE---------------------------------
#  d12.inla <- inla.smarginal(marginal = fit.consistency$marginals.fixed$d12)
#  plot(d12.inla, type = "l", xlab = expression(paste(d[12])), ylab = " ")

## ----NMAtau, echo=TRUE, eval=FALSE---------------------------------------
#  log.prec.het <- fit.consistency$internal.marginals.hyperpar$`Log precision for het`
#  tau2.inla <- inla.tmarginal(function(x) 1/exp(x), log.prec.het, n = 20000)
#  plot(tau2.inla, type = "l", xlab = expression(paste(tau)), ylab = " ")

## ----NMAtau2, echo=FALSE, eval=TRUE, fig.show='asis', message=FALSE, error=FALSE,warning=FALSE----
if (require('INLA')) {
  require(nmaINLA)
par(mfrow=c(2,1))
d12.inla <- inla.smarginal(marginal = fit.consistency$marginals.fixed$d12)
plot(d12.inla, type = "l", xlab = expression(paste(d[12])), ylab = " ", main = "A")
log.prec.het <- fit.consistency$internal.marginals.hyperpar$`Log precision for het`
tau2.inla <- inla.tmarginal(function(x) 1/exp(x), log.prec.het, n = 20000)
plot(tau2.inla, type = "l", xlab = expression(paste(tau)), ylab = " ", main = "B")
}

## ----NMjack, echo=TRUE, eval=FALSE---------------------------------------
#  fit.jackson <- nma_inla(SmokdatINLA, likelihood = "binomial",
#                          fixed.par = c(0, 1000), tau.prior = "uniform",
#                          tau.par = c(0, 5), kappa.prior = "uniform",
#                          kappa.par = c(0, 5), type = "jackson")

## ----Strokedata, echo=TRUE, eval=FALSE-----------------------------------
#  data("Strokedat", package = "nmaINLA")
#  # deleting 13th study
#  Strokedat.mreg <- Strokedat[-c(13),]
#  # centering the covariate
#  Strokedat.mreg$age <- Strokedat.mreg$age - mean(Strokedat.mreg$age)
#  # data preparation for INLA
#  StrokedatINLA.mreg <- create_INLA_dat(dat = Strokedat.mreg,
#                                        armVars = c('treatment' = 't','responders' = 'r',
#                                                    'sampleSize' = 'n'),
#                                        nArmsVar = 'na',
#                                        design = 'des',
#                                        covariate = 'age')

## ----NMAreg, echo=TRUE, eval=FALSE---------------------------------------
#  fit.Stroke.CONS.MREG.INLA <- nma_inla(StrokedatINLA.mreg, likelihood = "binomial",
#                                        fixed.par = c(0, 1000), tau.prior = "uniform",
#                                        tau.par = c(0, 2), type = 'consistency',
#                                        mreg = TRUE)

