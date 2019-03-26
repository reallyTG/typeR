library(airGR)


### Name: RunModel_CemaNeige
### Title: Run with the CemaNeige snow module
### Aliases: RunModel_CemaNeige

### ** Examples

library(airGR)

## load of catchment data
data(L0123002)

## preparation of the InputsModel object
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_CemaNeige, DatesR = BasinObs$DatesR,
                                 Precip = BasinObs$P,TempMean = BasinObs$T,
                                 ZInputs = BasinInfo$HypsoData[51], HypsoData=BasinInfo$HypsoData,
                                 NLayers = 5)

## run period selection
Ind_Run <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="01/01/1990"),
               which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="31/12/1999"))

## preparation of the RunOptions object
RunOptions <- CreateRunOptions(FUN_MOD = RunModel_CemaNeige, InputsModel = InputsModel,
                               IndPeriod_Run = Ind_Run)

## simulation
Param <- c(0.962, 2.249)
OutputsModel <- RunModel_CemaNeige(InputsModel = InputsModel,
                                   RunOptions = RunOptions, Param = Param)

## results preview
plot(OutputsModel)




