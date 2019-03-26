## ------------------------------------------------------------------------
library(PSF)

## ------------------------------------------------------------------------
nottem_model <- psf(nottem)
nottem_model

## ------------------------------------------------------------------------
sunspots_model <- psf(sunspots)
sunspots_model

## ------------------------------------------------------------------------
nottem_preds <- predict(nottem_model, n.ahead = 12)
nottem_preds

## ------------------------------------------------------------------------
sunspots_preds <- predict(sunspots_model, n.ahead = 48)
sunspots_preds

## ---- fig.width = 7, fig.height = 4--------------------------------------
plot(nottem_model, nottem_preds)

## ---- fig.width = 7, fig.height = 4--------------------------------------
plot(sunspots_model, sunspots_preds)

## ------------------------------------------------------------------------
library(PSF)
library(forecast)
options(warn=-1)
  
## Consider data `sunspots` with removal of last years's readings
# Training Data
train <- sunspots[1:2772]

# Test Data
test <- sunspots[2773:2820]

PSF <- NULL
ARIMA <- NULL
ETS <- NULL

for(i in 1:5)
{
  set.seed(i)
  
  # for PSF
  psf_model <- psf(train)
  a <- predict(psf_model, n.ahead = 48)

  # for ARIMA
  b <- forecast(auto.arima(train), 48)$mean
  
  # for ets
  c <- as.numeric(forecast(ets(train), 48)$mean)
  
  ## For Error Calculations
  # Error for PSF
  PSF[i] <- sqrt(mean((test - a)^2))
  # Error for ARIMA
  ARIMA[i] <- sqrt(mean((test - b)^2))
  # Error for ETS
  ETS[i] <- sqrt(mean((test - c)^2))

}

## Error values for PSF
  PSF
  mean(PSF)
  
## Error values for ARIMA
  ARIMA
  mean(ARIMA)
  
## Error values for ETS
  ETS
  mean(ETS)

