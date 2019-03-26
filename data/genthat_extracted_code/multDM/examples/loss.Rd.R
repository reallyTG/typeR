library(multDM)


### Name: loss
### Title: Computes Loss Function.
### Aliases: loss

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
l <- loss(realized=ts,evaluated=forecasts,loss.type="SE")



