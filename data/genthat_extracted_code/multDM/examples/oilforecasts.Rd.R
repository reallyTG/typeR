library(multDM)


### Name: oilforecasts
### Title: Sample Data from Crude Oil Price Forecasting.
### Aliases: oilforecasts

### ** Examples

data(oilforecasts)
ts <- oilforecasts[1,]
forecasts <- oilforecasts[-1,]
MDM.selection(realized=ts,evaluated=forecasts,q=8,alpha=0.1,statistic="Sc",loss.type="SE")



