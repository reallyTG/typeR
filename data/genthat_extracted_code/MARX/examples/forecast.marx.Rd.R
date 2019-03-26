library(MARX)


### Name: forecast.marx
### Title: Forecasting function for the MARX model
### Aliases: forecast.marx
### Keywords: forecasting

### ** Examples

## Forecasting MAR(0,1) model 4-periods ahead for lnbev (from dataset)
data <- MARX::dataset[,2]
y.for <- forecast.marx(y=data, p_C=0, p_NC=1, h=4, M=50, N=1000)



