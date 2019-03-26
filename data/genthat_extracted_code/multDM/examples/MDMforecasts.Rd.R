library(multDM)


### Name: MDMforecasts
### Title: Sample Data.
### Aliases: MDMforecasts

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
MDM.test(realized=ts,evaluated=forecasts,q=10,statistic="S",loss.type="AE")



