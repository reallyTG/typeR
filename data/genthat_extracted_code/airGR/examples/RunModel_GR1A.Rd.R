library(airGR)


### Name: RunModel_GR1A
### Title: Run with the GR1A hydrological model
### Aliases: RunModel_GR1A

### ** Examples

library(airGR)

## loading catchment data
data(L0123001)

## conversion of example data from daily to yearly time step
TabSeries       <- data.frame(BasinObs$DatesR, BasinObs$P, BasinObs$E, BasinObs$T, BasinObs$Qmm)
TimeFormat      <- "daily"
NewTimeFormat   <- "yearly"
ConvertFun      <- c("sum", "sum", "mean", "sum")
YearFirstMonth  <- 09;
NewTabSeries    <- SeriesAggreg(TabSeries = TabSeries, TimeFormat = TimeFormat, 
                                NewTimeFormat = NewTimeFormat, ConvertFun = ConvertFun, 
                                YearFirstMonth = YearFirstMonth)
BasinObs        <- NewTabSeries
names(BasinObs) <- c("DatesR", "P", "E", "T", "Qmm")

## preparation of the InputsModel object
InputsModel <- CreateInputsModel(FUN_MOD = RunModel_GR1A, DatesR = BasinObs$DatesR, 
                                 Precip = BasinObs$P, PotEvap = BasinObs$E)

## run period selection
Ind_Run <- seq(which(format(BasinObs$DatesR, format = "%Y")=="1990"), 
               which(format(BasinObs$DatesR, format = "%Y")=="1999"))

## preparation of the RunOptions object
RunOptions <- CreateRunOptions(FUN_MOD = RunModel_GR1A,
                               InputsModel = InputsModel, IndPeriod_Run = Ind_Run)

## simulation
Param <- c(0.840)
OutputsModel <- RunModel_GR1A(InputsModel = InputsModel, RunOptions = RunOptions, Param = Param)

## results preview
plot(OutputsModel, Qobs = BasinObs$Qmm[Ind_Run])

## efficiency criterion: Nash-Sutcliffe Efficiency
InputsCrit  <- CreateInputsCrit(FUN_CRIT = ErrorCrit_NSE, InputsModel = InputsModel, 
                                RunOptions = RunOptions, Qobs = BasinObs$Qmm[Ind_Run])
OutputsCrit <- ErrorCrit_NSE(InputsCrit = InputsCrit, OutputsModel = OutputsModel)



