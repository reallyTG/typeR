## ---- include=FALSE, fig.keep='none', results='hide'---------------------
library(airGR)
library(coda)
library(FME)
library(ggmcmc)
library(dplyr)
# source("airGR.R")
set.seed(123)
load(system.file("vignettes_data/Vignette_Param.rda", package = "airGR"))

## ---- warning=FALSE, fig.keep='none', results='hide', fig.height=10, fig.width=10, eval=TRUE, echo=FALSE, message=FALSE----
example("Calibration_Michel", echo = FALSE, ask = FALSE)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  example("Calibration_Michel")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  Likelihood <- sum((ObsY - ModY)^2, na.rm = TRUE)^(-sum(!is.na(ObsY)) / 2)
#  LL <- -2 * log(Likelihood)

## ---- results='hide'-----------------------------------------------------
RunAirGR4J <- function(Param_Optim) {
  ## Transformation to real space
  Param_Optim_Vre <- airGR::TransfoParam_GR4J(ParamIn = Param_Optim,
                                              Direction = "TR")
  ## Simulation given a parameter set
  OutputsModel <- airGR::RunModel_GR4J(InputsModel = InputsModel,
                                       RunOptions = RunOptions,
                                       Param = Param_Optim_Vre)
  ## Computation of the log-likelihood: N * log(SS)
  ObsY <- InputsCrit$Qobs
  ModY <- OutputsModel$Qsim
  LL <- sum(!is.na(ObsY)) * log(sum((ObsY - ModY)^2, na.rm = TRUE))
}

## ---- results='hide', eval=FALSE-----------------------------------------
#  optPORT <- stats::nlminb(start = c(4.1, 3.9, -0.9, -8.7),
#                           objective = RunAirGR4J,
#                           lower = rep(-9.9, times = 4), upper = rep(9.9, times = 4),
#                           control = list(trace = 1))
#  IniParam <- optPORT$par

## ---- results='hide', eval=FALSE-----------------------------------------
#  ListIniParam <- data.frame(Chain1 = IniParam, Chain2 = IniParam, Chain3 = IniParam,
#                             row.names = paste0("X", 1:4))
#  ListIniParam <- sweep(ListIniParam, MARGIN = 2, STATS = c(1, 0.9, 1.1), FUN = "*")
#  ListIniParam[ListIniParam < -9.9] <- -9.9
#  ListIniParam[ListIniParam > +9.9] <- +9.9
#  
#  mcmcDRAM <- apply(ListIniParam, 2, function(iListIniParam) {
#    FME::modMCMC(f            = RunAirGR4J,
#                 p            = iListIniParam,
#                 lower        = rep(-9.9, times = 4), ## lower bounds for GR4J
#                 upper        = rep(+9.9, times = 4), ## upper bounds for GR4J
#                 niter        = 2000,
#                 jump         = 0.01,
#                 outputlength = 2000,
#                 burninlength = 0,
#                 updatecov    = 100, ## Adaptative Metropolis
#                 ntrydr       = 2)   ## Delayed Rejection
#  })

## ---- results='hide'-----------------------------------------------------
MultDRAM <- coda::as.mcmc.list(lapply(mcmcDRAM, function(x) {
  coda::as.mcmc(airGR::TransfoParam_GR4J(as.matrix(x$pars), Direction = "TR"))
  }))
GelRub <- coda::gelman.diag(MultDRAM, autoburnin = TRUE)$mpsrf
GelRub

## ---- fig.width=6, fig.height=9, warning=FALSE---------------------------
ParamDRAM <- ggmcmc::ggs(MultDRAM) ## to convert objet for using by all ggs_* graphical functions
ggmcmc::ggs_traceplot(ParamDRAM)

## ---- fig.width=6, fig.height=9, warning=FALSE---------------------------
ParamDRAM_burn <- dplyr::filter(ParamDRAM, Iteration > 1000) # to keep only the second half of the series
ggmcmc::ggs_density(ParamDRAM_burn)

## ---- fig.width=6, fig.height=6------------------------------------------
ggmcmc::ggs_pairs(ParamDRAM_burn, lower = list(continuous = "density"))

