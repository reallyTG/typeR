## ------------------------------------------------------------------------
library(airGR)

## ------------------------------------------------------------------------
data(L0123001)
summary(BasinObs)

## ------------------------------------------------------------------------
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_GR4J, DatesR = BasinObs$DatesR,
                                 Precip = BasinObs$P, PotEvap = BasinObs$E)
str(InputsModel)

## ------------------------------------------------------------------------
Ind_Run <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="01/01/1990"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="31/12/1999"))
str(Ind_Run)

## ------------------------------------------------------------------------
RunOptions <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                               InputsModel = InputsModel, IndPeriod_Run = Ind_Run,
                               IniStates = NULL, IniResLevels = NULL, IndPeriod_WarmUp = NULL)
str(RunOptions)

## ------------------------------------------------------------------------
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                               RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run])
str(InputsCrit)

## ------------------------------------------------------------------------
CalibOptions <- CreateCalibOptions(FUN_MOD = RunModel_GR4J, FUN_CALIB = Calibration_Michel)
str(CalibOptions)

## ------------------------------------------------------------------------
OutputsCalib <- Calibration_Michel(InputsModel = InputsModel, RunOptions = RunOptions,
                                   InputsCrit = InputsCrit, CalibOptions = CalibOptions,
                                   FUN_MOD = RunModel_GR4J, FUN_CRIT = ErrorCrit_NSE)
Param <- OutputsCalib$ParamFinalR
Param

## ------------------------------------------------------------------------
OutputsModel <- RunModel_GR4J(InputsModel = InputsModel, RunOptions = RunOptions, Param = Param)
str(OutputsModel)

## ----eval=F--------------------------------------------------------------
#  plot(OutputsModel, Qobs = BasinObs$Qmm[Ind_Run])

## ------------------------------------------------------------------------
OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

## ------------------------------------------------------------------------
OutputsCrit <- ErrorCrit_KGE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

