## ------------------------------------------------------------------------
require("devRate")

## ------------------------------------------------------------------------
wuDS <- data.frame(
  temp = seq(from = 15, to = 37, by = 1), 
  devRate = 1/c(41.24, 37.16, 32.47, 26.22, 22.71, 19.01, 16.79, 15.63, 14.27, 12.48, 11.3, 
                 10.56, 9.69, 9.14, 8.24, 8.02, 7.43, 7.27, 7.35, 7.49, 7.63, 7.9, 10.03))

## ------------------------------------------------------------------------
broufasDS <- data.frame(
  temp = c(15.0, 17.0, 20.0, 22.0, 25.0, 27.0, 30.0, 33.0, 35.0), 
  devRate = 1/(c(595.4, 463.0, 260.5, 222.5, 161.8, 153.1, 136.0, 147.8, 182.1)/24))

## ------------------------------------------------------------------------
trpisDS <- data.frame(
  temp = c(14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 
           27.0, 28.0, 29.0, 30.0, 31.0, 32.0), 
  devRate = 1/(c(209.0, 174.0, 165.0, 125.0, 102.0, 90.0, 76.0, 62.0, 55.0, 50.0, 48.0, 
                44.0, 41.0, 39.0, 38.0, 37.5, 37.0, 38.0, 39.0)/24))

## ------------------------------------------------------------------------
messengerDS <- data.frame(
  temp = (c(55.0, 56.0, 57.0, 58.0, 60.0, 62.5, 65.0, 67.5, 70.0, 75.0, 80.0, 85.0, 87.5, 
            90.0, 92.5, 95.0, 96.0, 97.0, 97.5) - 32)/1.8, 
  devRate = 1/(c(263.0, 232.0, 170.5, 148.0, 121.3, 95.5, 74.0, 62.5, 51.5, 38.0, 30.5, 
                27.0, 25.0, 24.0, 23.5, 25.0, 26.5, 29.3, 34.3)/24))

## ------------------------------------------------------------------------
liu1DS <- data.frame(
  temp = c(8.3, 11.3, 14.3, 17.3, 20.1, 22.3, 24.7, 26.5, 28.0, 30.0, 33.0, 35.1), 
  devRate = 1/c(47.5, 26.1, 15.8, 11.2, 8.3, 6.7, 6.2, 5.7, 5.4, 5.1, 5.6, 7.1))

## ------------------------------------------------------------------------
liu2DS <- data.frame(
  temp = c(6.2, 8.3, 11.3, 14.3, 17.3, 20.1, 22.3, 24.7, 26.5, 28.0, 30.0), 
  devRate = 1/c(50.4, 33.9, 21.5, 14.3, 11.2, 8.0, 6.8, 6.2, 5.8, 6.1, 6.5))

## ------------------------------------------------------------------------
shiraiDS <- data.frame(
  temp = c(12.5, 15.0, 17.5, 20.0, 22.5, 25.0, 27.5, 30.0, 32.5), 
  devRate = 1/c(87.0, 55.5, 41.9, 32.4, 26.9, 21.7, 20.1, 20.6, 20.8))

## ------------------------------------------------------------------------
deJongDS <- data.frame(
  temp = c(15.1, 16.1, 17.1, 18.0, 21.7, 27.9, 30.1, 31.8), 
  devRate = c(0.0253, 0.0291, 0.0370, 0.0381, 0.0710, 0.1079, 0.1098, 0.0972))

## ------------------------------------------------------------------------
wuDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = wuDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

broufasDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = broufasDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

trpisDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = trpisDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

messengerDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = messengerDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

liu1DS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = liu1DS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

liu2DS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = liu2DS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

shiraiDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = shiraiDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

deJongDS_briere1_99 <- devRateModel(eq = briere1_99, 
  df = deJongDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40))

## ------------------------------------------------------------------------
briere1NLS <- list(wuDS_briere1_99, broufasDS_briere1_99, trpisDS_briere1_99, 
                   messengerDS_briere1_99, liu1DS_briere1_99, liu2DS_briere1_99, 
                   shiraiDS_briere1_99, deJongDS_briere1_99)

## ------------------------------------------------------------------------
listDS <- list(wuDS, broufasDS, trpisDS, messengerDS, liu1DS, liu2DS, shiraiDS, deJongDS)
briere1NLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = briere1_99, 
    df = myDataSet,
    startValues = list(aa = 0.01, Tmin = 10, Tmax = 40)
  )
})

## ------------------------------------------------------------------------
broufasDS_briere2_99 <- devRateModel(eq = briere2_99, 
  df = broufasDS,
  startValues = list(aa = 0.01, Tmin = 10, Tmax = 40, bb = 2))
### and so on ...

## ------------------------------------------------------------------------
briere2NLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = briere2_99, 
    df = myDataSet,
    startValues = list(aa = 0.01, Tmin = 10, Tmax = 40, bb = 2)
  )
})

## ------------------------------------------------------------------------
broufasDS_lactin2_95 <- devRateModel(eq = lactin2_95, 
  df = broufasDS,
  startValues = list(aa = 0.03, Tmax = 30, deltaT = 5.0, bb = -1.5))
### and so on ...

## ------------------------------------------------------------------------
lactin2NLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = lactin2_95,
    df = myDataSet,
    startValues = list(aa = 0.03, Tmax = 30, deltaT = 5.0, bb = -1.5)
  )
})

## ------------------------------------------------------------------------
perf2NLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = perf2_11, 
    df = myDataSet,
    startValues = list(cc = 0.02, T1 = 10, k = 0.5, T2 = 35)
  )
})

## ------------------------------------------------------------------------
betaNLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = beta_16, 
    df = myDataSet,
    startValues = list(rm = 0.2, T1 = 5, T2 = 40, Tm = 30)
  )
})

## ------------------------------------------------------------------------
ratkowskyNLS <- lapply(listDS, function(myDataSet){
  devRateModel(eq = ratkowsky_83, 
    df = myDataSet,
    startValues = list(cc = 0.02, T1 = 5, T2 = 40, k = 0.2)
  )
})

## ------------------------------------------------------------------------
listNLS <- list(briere1NLS, briere2NLS, lactin2NLS, perf2NLS, betaNLS, ratkowskyNLS)

## ------------------------------------------------------------------------
RSS <- t(sapply(1:6, function(myModel){
  sapply(1:8, function(myDS){
    return(sum((listDS[[myDS]][,2] - predict(listNLS[[myModel]][[myDS]]))^2))
  })
}))
rownames(RSS) <- c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky")
colnames(RSS) <- c("wu", "broufas", "trpis", "messenger", "liu1", "liu2", "shirai", "deJong")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(RSS) 

## ------------------------------------------------------------------------
R2 <- t(sapply(1:6, function(myModel){
  sapply(1:8, function(myDS){
    return(1 - sum((listDS[[myDS]][,2] - predict(listNLS[[myModel]][[myDS]]))^2) / 
      sum((listDS[[myDS]][,2] - mean(listDS[[myDS]][,2]))^2))
  })
}))
rownames(R2) <- c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky")
colnames(R2) <- c("wu", "broufas", "trpis", "messenger", "liu1", "liu2", "shirai", "deJong")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(R2) 

## ------------------------------------------------------------------------
R2adj <- t(sapply(1:6, function(myModel){
  p <- 1 + length(coef(listNLS[[myModel]][[1]]))
  sapply(1:8, function(myDS){
    n <- length(listDS[[myDS]][,2])
    Rsq <- 1 - sum((listDS[[myDS]][,2] - predict(listNLS[[myModel]][[myDS]]))^2) / 
      sum((listDS[[myDS]][,2] - mean(listDS[[myDS]][,2]))^2)
    return(1 - (n - 1)/(n - p) * (1 - Rsq))
  })
}))
rownames(R2adj) <- c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky")
colnames(R2adj) <- c("wu", "broufas", "trpis", "messenger", "liu1", "liu2", "shirai", "deJong")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(R2adj) 

## ------------------------------------------------------------------------
RMSE <- t(sapply(1:6, function(myModel){
  p <- 1 + length(coef(listNLS[[myModel]][[1]]))
  sapply(1:8, function(myDS){
    n <- length(listDS[[myDS]][,2])
    RSS <- sum((listDS[[myDS]][,2] - predict(listNLS[[myModel]][[myDS]]))^2)
    return(sqrt(RSS / (n - p + 1)))
  })
}))
rownames(RMSE) <- c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky")
colnames(RMSE) <- c("wu", "broufas", "trpis", "messenger", "liu1", "liu2", "shirai", "deJong")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(RMSE) 

## ------------------------------------------------------------------------
AICc <- t(sapply(1:6, function(myModel){
  p <- 1 + length(coef(listNLS[[myModel]][[1]]))
  sapply(1:8, function(myDS){
    n <- length(listDS[[myDS]][,2])
    RSS <- sum((listDS[[myDS]][,2] - predict(listNLS[[myModel]][[myDS]]))^2)
    L <- -n/2 * log(RSS / n)
    return(-2 * L + 2 * p * n / (n - p - 1))
  })
}))
# number of parameters + 1
p <- sapply(1:6, function(myModel){
  p <- 1 + length(coef(listNLS[[myModel]][[1]]))
  return(p)
})
# sample size
n <- sapply(1:8, function(myDS){
  n <- length(listDS[[myDS]][,2])
  return(n)
})
rownames(AICc) <- paste0(c("Briere-1", "Briere-2", "Lactin", 
      "Perf-2", "Beta", "Ratkowsky"), " (", p, ")")
colnames(AICc) <- paste0(c("wu", "broufas", "trpis", "messenger", 
      "liu1", "liu2", "shirai", "deJong"), " (", n, ")")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(AICc) 

## ------------------------------------------------------------------------
AIC <- t(sapply(1:6, function(myModel){
  sapply(1:8, function(myDS){
    return(AIC(listNLS[[myModel]][[myDS]]))
  })
}))
rownames(AIC) <- c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky")
colnames(AIC) <- c("wu", "broufas", "trpis", "messenger", "liu1", "liu2", "shirai", "deJong")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(AIC) 

## ---- fig.width = 6, fig.height = 6--------------------------------------
plot(x = listDS[[4]][,1], 
  y = listDS[[4]][,2], 
  ylim = c(0, 1), ylab = "Development rate",
  xlim = c(5, 40), xlab = "Temperature", type = "n")
for(i in 1:6){
  points(x = seq(from = 0, to = 50, by = 0.1), 
    y = predict(listNLS[[i]][[4]], newdata = list(T = seq(from = 0, to = 50, by = 0.1))), 
    type = 'l', lwd = 2, col = i)
}
points(x = listDS[[4]][,1], y = listDS[[4]][,2], pch = 16, cex = 1.5)
legend("topleft", col = 1:6, lwd = 2, legend = c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky"))

## ---- fig.width = 6, fig.height = 6--------------------------------------
plot(x = listDS[[3]][,1], 
  y = listDS[[3]][,2], 
  ylim = c(0, 0.7), ylab = "Development rate",
  xlim = c(5, 40), xlab = "Temperature", type = "n")
for(i in 1:6){
  points(x = seq(from = 0, to = 50, by = 0.1), 
    y = predict(listNLS[[i]][[3]], newdata = list(T = seq(from = 0, to = 50, by = 0.1))), 
    type = 'l', lwd = 2, col = i)
}
points(x = listDS[[3]][,1], y = listDS[[3]][,2], pch = 16, cex = 1.5)
legend("topleft", col = 1:6, lwd = 2, legend = c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky"))

## ---- fig.width = 7, fig.height = 6--------------------------------------
getPlot <- function(datasetNumber, ...){
  plot(x = listDS[[datasetNumber]][,1], 
    y = listDS[[datasetNumber]][,2], 
    ylab = "Development rate",
    xlab = "Temperature", type = "n", ...)
  for(i in 1:6){
    points(x = seq(from = 0, to = 50, by = 0.1), 
      y = predict(listNLS[[i]][[datasetNumber]], newdata = list(T = seq(from = 0, to = 50, by = 0.1))), 
      type = 'l', lwd = 2, col = i)
  }
  points(x = listDS[[datasetNumber]][,1], y = listDS[[datasetNumber]][,2], pch = 16, cex = 1.5)
  legend("topleft", col = 1:6, lwd = 2, 
         legend = c("Briere-1", "Briere-2", "Lactin", "Perf-2", "Beta", "Ratkowsky"))
}
par(mfrow = c(3, 2), mar = c(4, 4, 1, 1))
getPlot(datasetNumber = 1, ylim = c(0, 0.20), xlim = c(5, 40))
text(x = 40, y = 0.20, labels = "A", cex = 2, pos = 1)
getPlot(datasetNumber = 2, ylim = c(0, 0.25), xlim = c(5, 40))
text(x = 40, y = 0.25, labels = "B", cex = 2, pos = 1)
getPlot(datasetNumber = 5, ylim = c(0, 0.20), xlim = c(0, 40))
text(x = 40, y = 0.20, labels = "C", cex = 2, pos = 1)
getPlot(datasetNumber = 6, ylim = c(0, 0.20), xlim = c(0, 35))
text(x = 35, y = 0.20, labels = "D", cex = 2, pos = 1)
getPlot(datasetNumber = 7, ylim = c(0, 0.08), xlim = c(5, 40))
text(x = 40, y = 0.08, labels = "E", cex = 2, pos = 1)
getPlot(datasetNumber = 8, ylim = c(0, 0.15), xlim = c(5, 35))
text(x = 35, y = 0.15, labels = "F", cex = 2, pos = 1)

