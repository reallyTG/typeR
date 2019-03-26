## ------------------------------------------------------------------------
### Experimental temperatures and development rate for the eggs
expeTempEggs <- c(10.0, 10.0, 13.0, 15.0, 15.0, 15.5, 16.0, 16.0, 17.0, 20.0, 20.0, 
              25.0, 25.0, 30.0, 30.0, 35.0)
expeDevEggs <- c(0.031, 0.039, 0.072, 0.047, 0.059, 0.066, 0.083, 0.1, 0.1, 0.1, 0.143, 
             0.171, 0.2, 0.2, 0.18, 0.001)
dfDevEggs <- data.frame(expeTempEggs, expeDevEggs)

### Experimental temperatures and development rate for the larva
expeTempLarva <- c(10.0, 10.0, 10.0, 13.0, 15.0, 15.5, 15.5, 15.5, 17.0, 20.0, 25.0, 
                   25.0, 30.0, 35.0)
expeDevLarva <- c(0.01, 0.014, 0.019, 0.034, 0.024, 0.029, 0.034, 0.039, 0.067, 0.05, 
                  0.076, 0.056, 0.0003, 0.0002)
dfDevLarva <- data.frame(expeTempLarva, expeDevLarva)

### Experimental temperatures and development rate for the pupa
expeTempPupa <- c(10.0, 10.0, 10.0, 13.0, 15.0, 15.0, 15.5, 15.5, 16.0, 16.0, 17.0, 
                  20.0, 20.0, 25.0, 25.0, 30.0, 35.0)
expeDevPupa <- c(0.001, 0.008, 0.012, 0.044, 0.017, 0.044, 0.039, 0.037, 0.034, 0.051, 0.051, 0.08, 0.092, 0.102, 0.073, 0.005, 0.0002)
dfDevPupa <- data.frame(expeTempPupa, expeDevPupa)

### Same dataset included in the package in the form of matrices
library("devRate")
data(exTropicalMoth)
str(exTropicalMoth[[1]])

## ------------------------------------------------------------------------
devRateFind(orderSP = "Lepidoptera")

## ------------------------------------------------------------------------
devRateFind(familySP = "Gelechiidae")

## ------------------------------------------------------------------------
devRateFind(species = "Tecia solanivora")

## ------------------------------------------------------------------------
devRateFind(species = "Symmetrischema tangolias")
devRateFind(species = "Phthorimaea operculella")

## ------------------------------------------------------------------------
devRateInfo(eq = taylor_81)
devRateInfo(eq = lactin1_95)

## ------------------------------------------------------------------------
taylor_81$startVal[taylor_81$startVal["genSp"] == "Symmetrischema tangolias",]
lactin1_95$startVal[lactin1_95$startVal["genSp"] == "Phthorimaea operculella",]

## ---- fig.width = 6, fig.height = 6--------------------------------------
devRatePlotInfo (eq = taylor_81, sortBy = "ordersp",
  ylim = c(0, 0.20), xlim = c(0, 50))
devRatePlotInfo (eq = lactin1_95, sortBy = "ordersp",
  ylim = c(0, 1.00), xlim = c(0, 50))

## ------------------------------------------------------------------------
### using the vectors from section "Organizing the dataset"
############################################################

### for the taylor_81 model
mEggs01 <- devRateModel(eq = taylor_81, 
  temp = expeTempEggs, 
  devRate = expeDevEggs,
  startValues = list(Rm = 0.05, Tm = 30, To = 5))

mLarva01 <- devRateModel(eq = taylor_81, 
  temp = expeTempLarva, 
  devRate = expeDevLarva,
  startValues = list(Rm = 0.05, Tm = 25, To = 10))
      
mPupa01 <- devRateModel(eq = taylor_81, 
  temp = expeTempPupa, 
  devRate = expeDevPupa,
  startValues = list(Rm = 0.1, Tm = 30, To = 10))

### for the lactin1_95 model
mEggs01b <- devRateModel(eq = lactin1_95, 
  temp = expeTempEggs, 
  devRate = expeDevEggs,
  startValues = list(aa = 0.177, Tmax = 36.586, deltaT = 5.631))

# mLarva01b <- devRateModel(eq = lactin1_95, 
#   temp = expeTempLarva, 
#   devRate = expeDevLarva,
#   startValues = list(aa = 0.169, Tmax = 37.914, deltaT = 5.912))
### The algorithm has not found a solution after 50 iterations
### One possibility is to increase the maximum number of iterations
### using the "control" argument (see ?nls() for more details).

mLarva01b <- devRateModel(eq = lactin1_95, 
  temp = expeTempLarva, 
  devRate = expeDevLarva,
  startValues = list(aa = 0.169, Tmax = 37.914, deltaT = 5.912), 
  control = list(maxiter = 500))
      
mPupa01b <- devRateModel(eq = lactin1_95, 
  temp = expeTempPupa, 
  devRate = expeDevPupa,
  startValues = list(aa = 0.193, Tmax = 36.291, deltaT = 5.18), 
  control = list(maxiter = 500))

### using the data frames from section "Organizing the dataset"
############################################################

mEggs02 <- devRateModel(eq = taylor_81, 
  df = dfDevEggs,
  startValues = list(Rm = 0.05, Tm = 30, To = 5))

mLarva02 <- devRateModel(eq = taylor_81, 
  df = dfDevLarva,
  startValues = list(Rm = 0.05, Tm = 25, To = 10))
      
mPupa02 <- devRateModel(eq = taylor_81, 
  df = dfDevPupa,
  startValues = list(Rm = 0.1, Tm = 30, To = 10))

### using the dataset included in the package (only for taylor_81 model)
############################################################

mEggs <- devRateModel(eq = taylor_81, 
  temp = exTropicalMoth$raw$eggs[,1], 
  devRate = exTropicalMoth$raw$eggs[,2],
  startValues = list(Rm = 0.05, Tm = 30, To = 5))
      
mLarva <- devRateModel(eq = taylor_81, 
  temp = exTropicalMoth$raw$larva[,1], 
  devRate = exTropicalMoth$raw$larva[,2],
  startValues = list(Rm = 0.05, Tm = 25, To = 10))
      
mPupa <- devRateModel(eq = taylor_81, 
  temp = exTropicalMoth$raw$pupa[,1], 
  devRate = exTropicalMoth$raw$pupa[,2],
  startValues = list(Rm = 0.1, Tm = 30, To = 10))

## ------------------------------------------------------------------------
resultNLS <- devRatePrint(myNLS = mLarva, 
  temp = exTropicalMoth$raw$larva[,1], 
  devRate = exTropicalMoth$raw$larva[,2])

resultNLSb <- devRatePrint(myNLS = mLarva01b, 
  temp = exTropicalMoth$raw$larva[,1], 
  devRate = exTropicalMoth$raw$larva[,2])

## ---- fig.width = 7, fig.height = 5--------------------------------------
par(mfrow = c(1, 2), mar = c(4, 4, 0, 0))
devRatePlot(eq = taylor_81, 
  nlsDR = mEggs, 
  temp = exTropicalMoth$raw$eggs[,1], 
  devRate = exTropicalMoth$raw$eggs[,2],
  pch = 16, ylim = c(0, 0.2))

devRatePlot(eq = lactin1_95, 
  nlsDR = mEggs01b, 
  temp = exTropicalMoth$raw$eggs[,1], 
  devRate = exTropicalMoth$raw$eggs[,2],
  pch = 16, ylim = c(0, 0.2))
      
devRatePlot(eq = taylor_81, 
  nlsDR = mLarva, 
  temp = exTropicalMoth$raw$larva[,1], 
  devRate = exTropicalMoth$raw$larva[,2],
  pch = 16, ylim = c(0, 0.1))

devRatePlot(eq = lactin1_95, 
  nlsDR = mLarva01b, 
  temp = exTropicalMoth$raw$larva[,1], 
  devRate = exTropicalMoth$raw$larva[,2],
  pch = 16, ylim = c(0, 0.1))
      
devRatePlot(eq = taylor_81, 
  nlsDR = mPupa, 
  temp = exTropicalMoth$raw$pupa[,1], 
  devRate = exTropicalMoth$raw$pupa[,2],
  pch = 16, ylim = c(0, 0.15))

devRatePlot(eq = lactin1_95, 
  nlsDR = mPupa01b, 
  temp = exTropicalMoth$raw$pupa[,1], 
  devRate = exTropicalMoth$raw$pupa[,2],
  pch = 16, ylim = c(0, 0.15))

## ------------------------------------------------------------------------
### Models for the larva life stage
c(AIC(mLarva), AIC(mLarva01b))
c(BIC(mLarva), BIC(mLarva01b))
c(logLik(mLarva), logLik(mLarva01b))


## ------------------------------------------------------------------------
forecastTsolanivora <- devRateIBM(
  tempTS = rnorm(n = 100, mean = 15, sd = 1),
  timeStepTS = 1,
  models = list(mEggs, mLarva, mPupa),
  numInd = 50,
  stocha = 0.015,
  timeLayEggs = 1)
print(forecastTsolanivora)

## ---- fig.width = 6, fig.height = 6--------------------------------------
devRateIBMPlot(ibm = forecastTsolanivora, typeG = "density")

