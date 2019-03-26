## ------------------------------------------------------------------------
library("devRate")

## ------------------------------------------------------------------------
### script para analizar los datos de tasa de desarrollo de B. dorsalis en 
### función de la temperatura.
require("devRate") # para cargar el paquete devRate

## ------------------------------------------------------------------------
c(55.0, 56.0, 57.0, 58.0, 60.0, 62.5, 65.0, 67.5, 70.0, 75.0, 80.0, 85.0, 87.5, 
  90.0, 92.5, 95.0, 96.0, 97.0, 97.5)

## ------------------------------------------------------------------------
(c(55.0, 56.0, 57.0, 58.0, 60.0, 62.5, 65.0, 67.5, 70.0, 75.0, 80.0, 85.0, 87.5, 
  90.0, 92.5, 95.0, 96.0, 97.0, 97.5) - 32) / 1.8

## ------------------------------------------------------------------------
temp <- (c(55.0, 56.0, 57.0, 58.0, 60.0, 62.5, 65.0, 67.5, 70.0, 75.0, 80.0, 
           85.0, 87.5, 90.0, 92.5, 95.0, 96.0, 97.0, 97.5) - 32) / 1.8

## ------------------------------------------------------------------------
devRate <- 1/(c(263.0, 232.0, 170.5, 148.0, 121.3, 95.5, 74.0, 62.5, 51.5, 
                38.0, 30.5, 27.0, 25.0, 24.0, 23.5, 25.0, 26.5, 29.3, 34.3)/24)

## ------------------------------------------------------------------------
datosLab <- data.frame(temp, devRate)

## ------------------------------------------------------------------------
datosLab <- data.frame(
  temp = (c(55.0, 56.0, 57.0, 58.0, 60.0, 62.5, 65.0, 67.5, 70.0, 75.0, 80.0, 
            85.0, 87.5, 90.0, 92.5, 95.0, 96.0, 97.0, 97.5) - 32)/1.8, 
  devRate = 1/(c(263.0, 232.0, 170.5, 148.0, 121.3, 95.5, 74.0, 62.5, 51.5, 
            38.0, 30.5, 27.0, 25.0, 24.0, 23.5, 25.0, 26.5, 29.3, 34.3)/24))

## ------------------------------------------------------------------------
print(datosLab)

## ------------------------------------------------------------------------
plot(x = datosLab$temp, y = datosLab$devRate, 
     xlab = "Temperatura", ylab = "Tasa de desarrollo", 
     xlim = c(0, 40), ylim = c(0, 1.2))

## ------------------------------------------------------------------------
datosLab14 <- datosLab[1:14,]
plot(x = datosLab14$temp, y = datosLab14$devRate, 
     xlab = "Temperatura", ylab = "Tasa de desarrollo", 
     xlim = c(0, 40), ylim = c(0, 1.2))

## ------------------------------------------------------------------------
modLin <- devRateModel(eq = campbell_74, df = datosLab14)
plot(x = datosLab$temp, y = datosLab$devRate, 
     xlab = "Temperatura", ylab = "Tasa de desarrollo", 
     xlim = c(0, 40), ylim = c(0, 1.2)) # datos del laboratorio
abline(modLin) # añadir modelo lineal en el grafico
print(modLin) # imprimir resultados del ajuste del modelo

## ------------------------------------------------------------------------
devRateFind(species = "Bactrocera dorsalis")
campbell_74$startVal[campbell_74$startVal$genSp == "Bactrocera dorsalis",]

## ------------------------------------------------------------------------
names(devRateEqList)

## ------------------------------------------------------------------------
devRateFind(species = "Bactrocera dorsalis")
modNoLin_01 <- devRateModel(
  eq = briere1_99, # nombre del modelo
  df = datosLab, # nombre de los datos de laboratorio
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40)) # valores iniciales
print(modNoLin_01)
modNoLin_02 <- devRateModel(
  eq = briere2_99, # nombre del modelo
  df = datosLab, # nombre de los datos de laboratorio
  startValues = list(
    aa = 0.01, Tmin = 10, Tmax = 40, bb = 2)) # valores iniciales
print(modNoLin_02)
modNoLin_03 <- devRateModel(
  eq = lactin2_95, # nombre del modelo
  df = datosLab, # nombre de los datos de laboratorio
  startValues = list(
    aa = 0.03, Tmax = 30, deltaT = 5.0, bb = -1.5)) # valores iniciales
print(modNoLin_03)

## ---- fig.width = 7, fig.height = 3--------------------------------------
par(mfrow = c(1, 3)) # para hacer tres graficos en la misma pagina
devRatePlot(eq = briere1_99, 
  nlsDR = modNoLin_01, 
  temp = datosLab$temp, 
  devRate = datosLab$devRate, 
  xlim = c(10, 40), ylim = c(0, 1.2))
devRatePlot(eq = briere2_99, 
  nlsDR = modNoLin_02, 
  temp = datosLab$temp, 
  devRate = datosLab$devRate, 
  xlim = c(10, 40), ylim = c(0, 1.2))
devRatePlot(eq = lactin2_95, 
  nlsDR = modNoLin_03, 
  temp = datosLab$temp, 
  devRate = datosLab$devRate, 
  xlim = c(10, 40), ylim = c(0, 1.2))

## ------------------------------------------------------------------------
c(AIC(modNoLin_01), AIC(modNoLin_02), AIC(modNoLin_03))

## ------------------------------------------------------------------------
tempS <- seq(from = 0, to = 45, by = 0.1) # temperaturas simuladas
devRateS <- predict(modNoLin_02, newdata = list(T = tempS)) # predicciones
devRateS[devRateS < 0] <- 0
devRateS[is.na(devRateS)] <- 0
c(AIC(modNoLin_01), AIC(modNoLin_02), AIC(modNoLin_03))
Topt <- tempS[devRateS == max(devRateS)]
CTmin <- tempS[devRateS == min(devRateS[devRateS > 0 & 
  tempS < Topt])]
CTmax <- tempS[devRateS == min(devRateS[devRateS > 0 & 
  tempS > Topt])]
cat(paste0("Topt: ", Topt, "\nCTmin: ", CTmin, "\nTmax: ", CTmax))

## ------------------------------------------------------------------------
## cargar datos del laboratorio
datosLabTS_egg <- data.frame(
  temp = c(10.0, 10.0, 13.0, 15.0, 15.0, 15.5, 16.0, 16.0, 17.0, 20.0, 20.0, 
    25.0, 25.0, 30.0, 30.0, 35.0), 
  devRate = c(0.031, 0.039, 0.072, 0.047, 0.059, 0.066, 0.083, 0.1, 0.1, 0.1, 0.143, 
    0.171, 0.2, 0.2, 0.18, 0.001))
datosLabTS_larva <- data.frame(
  temp = c(10.0, 10.0, 10.0, 13.0, 15.0, 15.5, 15.5, 15.5, 17.0, 20.0, 25.0, 
    25.0, 30.0, 35.0), 
  devRate = c(0.01, 0.014, 0.019, 0.034, 0.024, 0.029, 0.034, 0.039, 0.067, 0.05, 
    0.076, 0.056, 0.0003, 0.0002))
datosLabTS_pupa <- data.frame(
  temp = c(10.0, 10.0, 10.0, 13.0, 15.0, 15.0, 15.5, 15.5, 16.0, 16.0, 17.0, 
    20.0, 20.0, 25.0, 25.0, 30.0, 35.0), 
  devRate = c(0.001, 0.008, 0.012, 0.044, 0.017, 0.044, 0.039, 0.037, 0.034, 0.051, 
    0.051, 0.08, 0.092, 0.102, 0.073, 0.005, 0.0002))
## ajustar un modelo a los datos (Lactin-1)
## ver vignette quickUserGuide para mayor informacion
modTs01_egg <- devRateModel(
  eq = lactin1_95, 
  df = datosLabTS_egg, 
  startValues = list(aa = 0.177, Tmax = 36.586, deltaT = 5.631))
modTs01_larva <- devRateModel(
  eq = lactin1_95, 
  df = datosLabTS_larva, 
  startValues = list(aa = 0.177, Tmax = 36.586, deltaT = 5.631))
modTs01_pupa <- devRateModel(
  eq = lactin1_95, 
  df = datosLabTS_pupa, 
  startValues = list(aa = 0.177, Tmax = 36.586, deltaT = 5.631))

## ---- fig.width = 7, fig.height = 3--------------------------------------
simul01 <- devRateIBM(
  tempTS = rnorm(n = 100, mean = 15, sd = 1),
  timeStepTS = 1,
  models = list(modTs01_egg, modTs01_larva, modTs01_pupa),
  numInd = 50,
  stocha = 0.025,
  timeLayEggs = 1)
print(simul01)
par(mar = c(4, 4, 0, 0))
devRateIBMPlot(ibm = simul01)

## ---- fig.width = 7, fig.height = 3--------------------------------------
simul02 <- devRateIBM(
  tempTS = rnorm(n = 100, mean = 17, sd = 1),
  timeStepTS = 1,
  models = list(modTs01_egg, modTs01_larva, modTs01_pupa),
  numInd = 50,
  stocha = 0.025,
  timeLayEggs = 1)
par(mar = c(4, 4, 0, 0))
devRateIBMPlot(ibm = simul02)

## ---- fig.width = 7, fig.height = 3--------------------------------------
simul02 <- devRateIBM(
  tempTS = rnorm(n = 100, mean = 17, sd = 2),
  timeStepTS = 1,
  models = list(modTs01_egg, modTs01_larva, modTs01_pupa),
  numInd = 50,
  stocha = 0.025,
  timeLayEggs = 1)
par(mar = c(4, 4, 0, 0))
devRateIBMPlot(ibm = simul02)

## ---- fig.width = 5, fig.height = 4--------------------------------------
tempEspacio <- matrix(rnorm(100, mean = 15, sd = 1), ncol = 10) # mapa teorico
myDevRate <- 1/devRateMap(nlsDR = modTs01_egg, tempMap = tempEspacio) +
  1/devRateMap(nlsDR = modTs01_larva, tempMap = tempEspacio) +
  1/devRateMap(nlsDR = modTs01_pupa, tempMap = tempEspacio)
filled.contour(100 / myDevRate, # numero de generaciones en 100 dias
	col = rev(heat.colors(30)), 
	main = "#generaciones", plot.axes = FALSE)

