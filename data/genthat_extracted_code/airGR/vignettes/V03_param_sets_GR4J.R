## ---- warning=FALSE, include=FALSE---------------------------------------
library(airGR)
options(digits = 3)

## ---- warning=FALSE------------------------------------------------------

## loading catchment data
data(L0123001)

## loading generalist parameter sets
data(Param_Sets_GR4J)

## ---- warning=FALSE------------------------------------------------------
Param_Sets_GR4J$X4 <- Param_Sets_GR4J$X4u / 5.995 * BasinInfo$BasinArea^0.3
Param_Sets_GR4J$X4u <- NULL
Param_Sets_GR4J <- as.matrix(Param_Sets_GR4J)

## ---- warning=FALSE, echo=FALSE------------------------------------------
summary(Param_Sets_GR4J)

## ---- warning=FALSE, include=TRUE----------------------------------------

## preparation of the InputsModel object
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_GR4J, DatesR = BasinObs$DatesR, 
                                 Precip = BasinObs$P, PotEvap = BasinObs$E)

## ---- calibration step

## short calibration period selection (< 6 months)
Ind_Cal <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y %H:%M")=="01/01/1990 00:00"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y %H:%M")=="28/02/1990 00:00"))

## preparation of the RunOptions object for the calibration period
RunOptions_Cal <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                               InputsModel = InputsModel, IndPeriod_Run = Ind_Cal)

## efficiency criterion: Nash-Sutcliffe Efficiency
InputsCrit_Cal  <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                                    RunOptions = RunOptions_Cal, Qobs = BasinObs$Qmm[Ind_Cal])


## ---- validation step

## validation period selection
Ind_Val <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y %H:%M")=="01/03/1990 00:00"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y %H:%M")=="31/12/1999 00:00"))

## preparation of the RunOptions object for the validation period
RunOptions_Val <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                                   InputsModel = InputsModel, IndPeriod_Run = Ind_Val)

## efficiency criterion (Nash-Sutcliffe Efficiency) on the validation period
InputsCrit_Val  <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                                RunOptions = RunOptions_Val, Qobs = BasinObs$Qmm[Ind_Val])


## ---- warning=FALSE, message=FALSE---------------------------------------
OutputsCrit_Loop <- apply(Param_Sets_GR4J, 1, function(iParam) {
  OutputsModel_Cal <- RunModel_GR4J(InputsModel = InputsModel, RunOptions = RunOptions_Cal,
                                    Param = iParam)
  OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit_Cal, OutputsModel = OutputsModel_Cal)
  return(OutputsCrit$CritValue)
})

## ---- echo=FALSE---------------------------------------------------------
OutputsCrit_Loop

## ---- warning=FALSE, message=FALSE, echo=FALSE---------------------------
Param_Best <- unlist(Param_Sets_GR4J[which.max(OutputsCrit_Loop), ])
Param_Best

## validation
OutputsModel_Val <- RunModel_GR4J(InputsModel = InputsModel, RunOptions = RunOptions_Val, Param = Param_Best)
OutputsCrit_Val <- ErrorCrit_NSE(InputsCrit = InputsCrit_Val, OutputsModel = OutputsModel_Val)

## ---- warning=FALSE, message=FALSE---------------------------------------
CalibOptions <- CreateCalibOptions(FUN_MOD = RunModel_GR4J, FUN_CALIB = Calibration_Michel)


## ---- warning=FALSE, message=FALSE, include=FALSE------------------------
## calibration
OutputsCalib <- Calibration(InputsModel = InputsModel, RunOptions = RunOptions_Cal,
                            InputsCrit = InputsCrit_Cal, CalibOptions = CalibOptions,
                            FUN_MOD = RunModel_GR4J, FUN_CRIT = ErrorCrit_NSE, 
                            FUN_CALIB = Calibration_Michel)
OutputsModel_Cal <- RunModel(InputsModel = InputsModel, RunOptions = RunOptions_Cal, 
                             Param = OutputsCalib$ParamFinalR, FUN = RunModel_GR4J)
OutputsCrit_Cal <- ErrorCrit_NSE(InputsCrit = InputsCrit_Cal, OutputsModel = OutputsModel_Cal)


## validation 
OutputsModel_Val <- RunModel_GR4J(InputsModel = InputsModel, RunOptions = RunOptions_Val, Param = OutputsCalib$ParamFinalR)
OutputsCrit_Val <- ErrorCrit_NSE(InputsCrit = InputsCrit_Val, OutputsModel = OutputsModel_Val)

## ---- warning=FALSE, message=FALSE, echo=FALSE---------------------------
names(OutputsCalib$ParamFinalR) <- paste0("X", 1:4)
OutputsCalib$ParamFinalR

## ---- warning=FALSE, message=FALSE---------------------------------------
CalibOptions <- CreateCalibOptions(FUN_MOD = RunModel_GR4J, FUN_CALIB = Calibration_Michel,
                                   StartParamList = Param_Sets_GR4J)

## ---- warning=FALSE, message=FALSE, include=FALSE------------------------
## calibration
OutputsCalib <- Calibration(InputsModel = InputsModel, RunOptions = RunOptions_Cal,
                            InputsCrit = InputsCrit_Cal, CalibOptions = CalibOptions,
                            FUN_MOD = RunModel_GR4J, FUN_CRIT = ErrorCrit_NSE, 
                            FUN_CALIB = Calibration_Michel)
OutputsModel_Cal <- RunModel(InputsModel = InputsModel, RunOptions = RunOptions_Cal, 
                         Param = OutputsCalib$ParamFinalR, FUN = RunModel_GR4J)
OutputsCrit_Cal <- ErrorCrit_NSE(InputsCrit = InputsCrit_Cal, OutputsModel = OutputsModel_Cal)


## validation 
OutputsModel_Val <- RunModel_GR4J(InputsModel = InputsModel, RunOptions = RunOptions_Val, Param = OutputsCalib$ParamFinalR)
OutputsCrit_Val <- ErrorCrit_NSE(InputsCrit = InputsCrit_Val, OutputsModel = OutputsModel_Val)

## ---- warning=FALSE, message=FALSE, echo=FALSE---------------------------
names(OutputsCalib$ParamFinalR) <- paste0("X", 1:4)
OutputsCalib$ParamFinalR

