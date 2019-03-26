## ----cran_install, eval = FALSE------------------------------------------
#  install.packages("forecastHybrid")

## ----github_install, eval = FALSE----------------------------------------
#  devtools::install_github("ellisp/forecastHybrid/pkg")

## ----load_library, message = FALSE---------------------------------------
library(forecastHybrid)

## ----quickstart, cache = TRUE--------------------------------------------
quickModel <- hybridModel(USAccDeaths)
forecast(quickModel)
plot(forecast(quickModel), main = "Forecast from auto.arima, ets, thetam, nnetar, stlm, and tbats model")

## ----basic_model, cache = TRUE-------------------------------------------

# Build a hybrid forecast on a simulated dataset using auto.arima, ets, and tbats models.
# Each model is given equal weight 
set.seed(12345)
series <- ts(rnorm(18), f = 2)
hm1 <- hybridModel(y = series, models = "aet", weights = "equal")

## ----individualModels, cache = TRUE--------------------------------------
# View the individual models 
hm1$auto.arima

# See forecasts from the auto.arima model
plot(forecast(hm1$auto.arima))

## ----object_class, cache = TRUE------------------------------------------
class(hm1) 
is.hybridModel(hm1)

## ----printSummary, cache = TRUE------------------------------------------
print(hm1) 
summary(hm1)

## ----plots, cache = TRUE-------------------------------------------------
plot(quickModel, type = "fit")
plot(quickModel, type = "models")

## ----plots_ggplot, cache = TRUE------------------------------------------
plot(quickModel, type = "fit", ggplot = TRUE)
plot(quickModel, type = "models", ggplot = TRUE)

## ----errorMethod, cache = TRUE-------------------------------------------
hm2 <- hybridModel(series, weights = "insample.errors", errorMethod = "MASE", models = "aenst")
hm2 

## ----viewWeights, cache = TRUE-------------------------------------------
hm2$weights 
newWeights <- c(0.1, 0.2, 0.3, 0.1, 0.3)
names(newWeights) <- c("auto.arima", "ets", "nnetar", "stlm", "tbats")
hm2$weights <- newWeights
hm2
hm2$weights[1] <- 0.2
hm2$weights[2] <- 0.1
hm2

## ----generics, cache = TRUE----------------------------------------------
# View the first 10 fitted values and residuals
head(fitted(hm1))
head(residuals(hm1))

## ----accuracy_ensemble, cache = TRUE-------------------------------------
accuracy(hm1) 

## ----accuracy_individual, cache = TRUE-----------------------------------
accuracy(hm1, individual = TRUE) 

## ----basic_forecast, cache = TRUE----------------------------------------
hForecast <- forecast(hm1, h = 48) 

## ----plot_forecast, cache = TRUE-----------------------------------------
plot(hForecast) 

## ----advanced_fit, cache = TRUE------------------------------------------
hm3 <- hybridModel(y = series, models = "aefnst",
                   a.args = list(max.p = 12, max.q = 12, approximation = FALSE),
                   n.args = list(repeats = 50),
                   s.args = list(robust = TRUE),
                   t.args = list(use.arma.errors = FALSE)) 

## ----lambda, cache = TRUE------------------------------------------------
hm4 <- hybridModel(y = wineind, models = "ae", lambda = 0.15)
hm4$auto.arima$lambda 
hm4$ets$lambda

## ----advancedLambda, cache = TRUE----------------------------------------
hm5 <- hybridModel(y = USAccDeaths, models = "aens", lambda = 0.2,
                   a.args = list(lambda = 0.5),
                   n.args = list(lambda = 0.6)) 
hm5$auto.arima$lambda
hm5$ets$lambda
hm5$nnetar$lambda
hm5$stlm$lambda


## ----xreg, cache = TRUE--------------------------------------------------
# Use the beaver1 dataset with the variable "activ" as a covariate and "temp" as the time series
# Divice this into a train and test set
trainSet <- beaver1[1:100, ] 
testSet <- beaver1[-(1:100), ]
trainXreg <- matrix(trainSet$activ)
testXreg <- matrix(testSet$activ)

# Create the model
beaverhm <- hybridModel(ts(trainSet$temp, f = 6),
                        models = "aenst",
                        a.args = list(xreg = trainXreg),
                        n.args = list(xreg = trainXreg),
                        s.args = list(xreg = trainXreg, method = "arima"))
# Forecast future values
beaverfc <- forecast(beaverhm, xreg = testXreg)

# View the accuracy of the model
accuracy(beaverfc, testSet$temp)

## ---- cvts_comparison, cache=TRUE----------------------------------------
stlmMod <- cvts(woolyrnq, FUN = stlm, windowSize = 100, maxHorizon = 8)
naiveMod <- cvts(woolyrnq, FUN = naive, windowSize = 100, maxHorizon = 8)
accuracy(stlmMod)
accuracy(naiveMod)

## ---- woolyrnq_plot------------------------------------------------------
plot(woolyrnq)

## ---- custom_cvts, cache=TRUE--------------------------------------------
library(GMDH)
GMDHForecast <- function(x, h){
  fc <- GMDH::fcast(x, f.number = h)
  # GMDH doesn't produce a ts object with correct attributes, so we build it
  end <- tsp(x)[2]
  freq <- frequency(x)
  # Set the correct start, end, and frequency for the ts forecast object
  tsProperties <- c(end + 1 / freq, end + h / freq, freq)
  tsp(fc$mean) <- tsProperties
  tsp(fc$upper) <- tsProperties
  tsp(fc$lower) <- tsProperties
  class(fc) <- "forecast"
  return(fc)
}
series <- subset(woolyrnq, end = 12)
gmdhcv <- cvts(series, FCFUN = GMDHForecast, windowSize = 10, maxHorizon = 1)

## ---- custom_naive_cvts, cache=TRUE--------------------------------------
customMod <- function(x){
 result <- list()
 result$series <- x
 result$last <- tail(x, n = 1)
 class(result) <- "customMod"
 return(result)
}
forecast.customMod <- function(x, h = 12){
 result <- list()
 result$model <- x
 result$mean <- rep(x$last, h)
 class(result) <- "forecast"
 return(result)
}
series <- subset(AirPassengers, end = 94)

