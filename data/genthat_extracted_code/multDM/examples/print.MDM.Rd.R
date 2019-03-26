library(multDM)


### Name: print.MDM
### Title: Prints 'MDM' Object.
### Aliases: print.MDM

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
m <- MDM.test(realized=ts,evaluated=forecasts,q=10,statistic="S",loss.type="AE")
print(m)



