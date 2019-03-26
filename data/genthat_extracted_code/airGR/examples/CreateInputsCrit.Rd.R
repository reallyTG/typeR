library(airGR)


### Name: CreateInputsCrit
### Title: Creation of the InputsCrit object required to the ErrorCrit
###   functions
### Aliases: CreateInputsCrit

### ** Examples

library(airGR)

## loading catchment data
data(L0123001)

## preparation of the InputsModel object
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_GR4J, DatesR = BasinObs$DatesR, 
                                 Precip = BasinObs$P, PotEvap = BasinObs$E)

## run period selection
Ind_Run <- seq(which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="01/01/1990"), 
               which(format(BasinObs$DatesR, format = "%d/%m/%Y")=="31/12/1999"))

## preparation of the RunOptions object
RunOptions <- CreateRunOptions(FUN_MOD = RunModel_GR4J,
                               InputsModel = InputsModel, IndPeriod_Run = Ind_Run)

## simulation
Param <- c(734.568, -0.840, 109.809, 1.971)
OutputsModel <- RunModel(InputsModel = InputsModel, RunOptions = RunOptions, 
                         Param = Param, FUN = RunModel_GR4J)

## efficiency criterion: Nash-Sutcliffe Efficiency
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                               RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run])
OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

## efficiency criterion: Nash-Sutcliffe Efficiency on log-transformed flows
transfo <- "log"
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                               RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run],
                               transfo = transfo)
OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

## efficiency criterion: Nash-Sutcliffe Efficiency above a threshold (q75%)
BoolCrit <- rep(TRUE, length(BasinObs$Qmm[Ind_Run])); 
BoolCrit[BasinObs$Qmm[Ind_Run]<quantile(BasinObs$Qmm[Ind_Run], 0.75, na.rm = TRUE)] <- FALSE
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                               RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run],
                               BoolCrit = BoolCrit)
OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

## efficiency criterion: Kling-Gupta Efficiency
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_KGE, InputsModel = InputsModel, 
                               RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run])
OutputsCrit <- ErrorCrit_KGE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)

## efficiency criterion: Kling-Gupta Efficiency below a threshold (q10%) on log-transformed flows
transfo  <- "log"
BoolCrit <- rep(TRUE, length(BasinObs$Qmm[Ind_Run])); 
BoolCrit[BasinObs$Qmm[Ind_Run]>quantile(BasinObs$Qmm[Ind_Run], 0.10, na.rm = TRUE)] <- FALSE
InputsCrit <- CreateInputsCrit(FUN_CRIT = ErrorCrit_KGE,
                               InputsModel = InputsModel,RunOptions = RunOptions, 
                               Qobs = BasinObs$Qmm[Ind_Run], BoolCrit = BoolCrit, transfo = transfo)
OutputsCrit <- ErrorCrit_KGE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)



