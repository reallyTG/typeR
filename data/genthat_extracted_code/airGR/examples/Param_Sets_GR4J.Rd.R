library(airGR)


### Name: Param_Sets_GR4J
### Title: Generalist parameter sets for the GR4J model
### Aliases: Param_Sets_GR4J

### ** Examples

library(airGR)

## loading catchment data
data(L0123001)

## loading generalist parameter sets
data(Param_Sets_GR4J)
str(Param_Sets_GR4J)

## computation of the real GR4J X4
Param_Sets_GR4J$X4 <- Param_Sets_GR4J$X4u / 5.995 * BasinInfo$BasinArea^0.3
Param_Sets_GR4J$X4u <- NULL
Param_Sets_GR4J <- as.matrix(Param_Sets_GR4J)

## preparation of the InputsModel object
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_GR4J, DatesR = BasinObs$DatesR, 
                                 Precip = BasinObs$P, PotEvap = BasinObs$E)

## ---- calibration step

## short calibration period selection (< 6 months)
Ind_Cal <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="01/01/1990"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="28/02/1990"))

## preparation of the RunOptions object for the calibration period
RunOptions_Cal <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                               InputsModel = InputsModel, IndPeriod_Run = Ind_Cal)

## simulation and efficiency criterion (Nash-Sutcliffe Efficiency)
## with all generalist parameter sets on the calibration period
OutputsCrit_Loop <- apply(Param_Sets_GR4J, 1, function(Param) {
  OutputsModel_Cal <- RunModel_GR4J(InputsModel = InputsModel,
                                    RunOptions = RunOptions_Cal,
                                    Param = Param)
  InputsCrit  <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                                  RunOptions = RunOptions_Cal, Qobs = BasinObs$Qmm[Ind_Cal])
  OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel_Cal)
  return(OutputsCrit$CritValue)
})

## best parameter set
Param_Best <- unlist(Param_Sets_GR4J[which.max(OutputsCrit_Loop), ])


## ---- validation step

## validation period selection
Ind_Val <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="01/03/1990"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="31/12/1999"))

## preparation of the RunOptions object for the validation period
RunOptions_Val <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                                   InputsModel = InputsModel, IndPeriod_Run = Ind_Val)

## simulation with the best parameter set on the validation period
OutputsModel_Val <- RunModel_GR4J(InputsModel = InputsModel,
                                  RunOptions = RunOptions_Val,
                                  Param = Param_Best)

## results preview of the simulation with the best parameter set on the validation period
plot(OutputsModel_Val, Qobs = BasinObs$Qmm[Ind_Val])

## efficiency criterion (Nash-Sutcliffe Efficiency) on the validation period
InputsCrit_Val  <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                                RunOptions = RunOptions_Val, Qobs = BasinObs$Qmm[Ind_Val])
OutputsCrit_Val <- ErrorCrit_NSE(InputsCrit = InputsCrit_Val, OutputsModel = OutputsModel_Val)



