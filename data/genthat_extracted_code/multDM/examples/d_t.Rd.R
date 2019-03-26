library(multDM)


### Name: d_t
### Title: Computes Loss Differential.
### Aliases: d_t

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
l <- loss(realized=ts,evaluated=forecasts,loss.type="SE")
d <- d_t(l)



