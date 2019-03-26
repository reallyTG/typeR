library(multDM)


### Name: TB_MA
### Title: Checks for a Lag in VMA Process with Tiao-Box Procedure.
### Aliases: TB_MA

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
l <- loss(realized=ts,evaluated=forecasts,loss.type="SE")
d <- d_t(l)
TB_MA(d=d,q.max=10)



