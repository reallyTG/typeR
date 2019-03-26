library(aurelius)


### Name: extract_params.Arima
### Title: extract_params.Arima
### Aliases: extract_params.Arima

### ** Examples

model <- stats::arima(presidents, c(3, 0, 0))
extracted_model <- extract_params(model)

model <- forecast::Arima(USAccDeaths, order=c(2,2,2), seasonal=c(0,2,2))
extracted_model <- extract_params(model)

model <- forecast::auto.arima(WWWusage)
extracted_model <- extract_params(model)



