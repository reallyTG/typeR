## ---- message = FALSE----------------------------------------------------
library(climwin)

## ---- eval = FALSE-------------------------------------------------------
#  
#  MassWin <- slidingwin(xvar = list(Temp = MassClimate$Temp),
#                        cdate = MassClimate$Date,
#                        bdate = Mass$Date,
#                        baseline = lm(Mass ~ 1, data = Mass),
#                        cinterval = "day",
#                        range = c(150, 0),
#                        type = "absolute", refday = c(20, 05),
#                        stat = "mean",
#                        func = "lin")
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#      head(MassWin[[1]]$Dataset)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#      MassWin[[1]]$BestModel
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  Call:
#  lm(formula = Yvar ~ climate, data = modeldat)
#  
#  Coefficients:
#  (Intercept)      climate
#      163.544       -4.481
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#      head(MassWin[[1]]$BestModelData)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  MassRand <- randwin(repeats = 5,
#                      xvar = list(Temp = MassClimate$Temp),
#                      cdate = MassClimate$Date,
#                      bdate = Mass$Date,
#                      baseline = lm(Mass ~ 1, data = Mass),
#                      cinterval = "day",
#                      range = c(150, 0),
#                      type = "absolute", refday = c(20, 05),
#                      stat = "mean",
#                      func = "lin")
#  

## ---- eval = F-----------------------------------------------------------
#  
#  MassRand[[1]]
#  

## ---- eval = F-----------------------------------------------------------
#  
#  pvalue(dataset = MassWin[[1]]$Dataset, datasetrand = MassRand[[1]], metric = "C", sample.size = 47)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  1.94e-05
#  

## ---- fig.width = 4, fig.height = 4, message = FALSE---------------------

plothist(dataset = MassOutput, datasetrand = MassRand)


## ---- fig.width = 4, fig.height = 4--------------------------------------

plotdelta(dataset = MassOutput)


## ---- fig.width = 4, fig.height = 4--------------------------------------

plotweights(dataset = MassOutput)


## ---- fig.width = 4, fig.height = 4--------------------------------------

plotbetas(dataset = MassOutput)


## ---- fig.width = 4, fig.height = 4--------------------------------------

plotwin(dataset = MassOutput)


## ------------------------------------------------------------------------

MassSingle <- singlewin(xvar = list(Temp = MassClimate$Temp),
                        cdate = MassClimate$Date,
                        bdate = Mass$Date,
                        baseline = lm(Mass ~ 1, data = Mass),
                        cinterval = "day",
                        range = c(72, 15),
                        type = "absolute", refday = c(20, 5),
                        stat = "mean",
                        func = "lin")


## ---- fig.width = 6, fig.height = 6--------------------------------------

plotbest(dataset = MassOutput,
         bestmodel = MassSingle$BestModel, 
         bestmodeldata = MassSingle$BestModelData)


## ---- fig.width = 10, fig.height = 7.5-----------------------------------

plotall(dataset = MassOutput,
        datasetrand = MassRand,
        bestmodel = MassSingle$BestModel, 
        bestmodeldata = MassSingle$BestModelData)


## ---- eval = FALSE-------------------------------------------------------
#  
#  MassWin2 <- slidingwin(xvar = list(Temp = MassClimate$Temp),
#                         cdate = MassClimate$Date,
#                         bdate = Mass$Date,
#                         baseline = lm(Mass ~ 1, data = Mass),
#                         cinterval = "day",
#                         range = c(150, 0),
#                         type = "absolute", refday = c(20, 5),
#                         stat = c("max", "mean"),
#                         func = c("lin", "quad"))
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  MassWin2$combos
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  MassWin2[[3]]$BestModel
#  

## ---- eval = FALSE-------------------------------------------------------
#  Call:
#  lm(formula = Yvar ~ climate + I(climate^2), data = modeldat)
#  
#  Coefficients:
#   (Intercept)       climate  I(climate^2)
#     139.39170      -1.33767       0.03332

