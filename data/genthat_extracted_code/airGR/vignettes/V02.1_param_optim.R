## ---- warning=FALSE, include=FALSE, fig.keep='none', results='hide'------
library(airGR)
library(DEoptim)
library(hydroPSO)
library(Rmalschains)
# source("airGR.R")
set.seed(321)
load(system.file("vignettes_data/Vignette_Param.rda", package = "airGR"))

## ---- warning=FALSE, fig.keep='none', results='hide', fig.height=10, fig.width=10, eval=TRUE, echo=FALSE, message=FALSE----
example("Calibration_Michel", echo = FALSE, ask = FALSE)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  example("Calibration_Michel")

## ---- warning=FALSE, results='hide'--------------------------------------
OptimGR4J <- function(Param_Optim) {
  ## Transformation of the parameter set to real space
  Param_Optim_Vre <- airGR::TransfoParam_GR4J(ParamIn = Param_Optim,
                                              Direction = "TR")
  ## Simulation given a parameter set
  OutputsModel <- airGR::RunModel_GR4J(InputsModel = InputsModel,
                                       RunOptions = RunOptions,
                                       Param = Param_Optim_Vre)
  ## Computation of the value of the performance criteria
  OutputsCrit <- airGR::ErrorCrit_RMSE(InputsCrit = InputsCrit,
                                       OutputsModel = OutputsModel,
                                       verbose = FALSE)
  return(OutputsCrit$CritValue)
}

## ---- warning=FALSE, results='hide'--------------------------------------
lowerGR4J <- rep(-9.99, times = 4)
upperGR4J <- rep(+9.99, times = 4)

## ---- warning=FALSE, results='hide', eval=FALSE--------------------------
#  optPORT <- stats::nlminb(start = c(4.1, 3.9, -0.9, -8.7),
#                           objective = OptimGR4J,
#                           lower = lowerGR4J, upper = upperGR4J,
#                           control = list(trace = 1))

## ---- warning=FALSE, results='hide', eval=FALSE--------------------------
#  startGR4J <- expand.grid(data.frame(CalibOptions$StartParamDistrib))
#  optPORT_ <- function(x) {
#    opt <- stats::nlminb(start = x,
#                         objective = OptimGR4J,
#                         lower = lowerGR4J, upper = upperGR4J,
#                         control = list(trace = 1))
#  }
#  list_opt <- apply(startGR4J, 1, optPORT_)

## ---- warning=FALSE, results='hide'--------------------------------------
list_par <- t(sapply(list_opt, function(x) x$par))
list_obj <- sapply(list_opt, function(x) x$objective)
df_port  <- data.frame(list_par, RMSE = list_obj)

## ---- warning=FALSE------------------------------------------------------
summary(df_port)

## ---- warning=FALSE, results='hide', eval=FALSE--------------------------
#  optDE <- DEoptim::DEoptim(fn = OptimGR4J,
#                            lower = lowerGR4J, upper = upperGR4J,
#                            control = DEoptim::DEoptim.control(NP = 40, trace = 10))

## ---- warning=FALSE, results='hide', message=FALSE, eval=FALSE-----------
#  optPSO <- hydroPSO::hydroPSO(fn = OptimGR4J,
#                               lower = lowerGR4J, upper = upperGR4J,
#                               control = list(write2disk = FALSE, verbose = FALSE))

## ---- warning=FALSE, results='hide', eval=FALSE--------------------------
#  optMALS <- Rmalschains::malschains(fn = OptimGR4J,
#                                     lower = lowerGR4J, upper = upperGR4J,
#                                     maxEvals = 2000)

## ---- warning=FALSE, echo=FALSE------------------------------------------
data.frame(Algo = c("airGR", "PORT", "DE", "PSO", "MA-LS"), 
           round(rbind(
                                                OutputsCalib$ParamFinalR                          ,
             airGR::TransfoParam_GR4J(ParamIn = optPORT$par                    , Direction = "TR"),
             airGR::TransfoParam_GR4J(ParamIn = as.numeric(optDE$optim$bestmem), Direction = "TR"),
             airGR::TransfoParam_GR4J(ParamIn = as.numeric(optPSO$par)         , Direction = "TR"),
             airGR::TransfoParam_GR4J(ParamIn = optMALS$sol                    , Direction = "TR")),
             digits = 3))


