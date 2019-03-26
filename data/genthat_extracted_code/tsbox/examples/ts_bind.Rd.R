library(tsbox)


### Name: ts_bind
### Title: Bind Time Series
### Aliases: ts_bind ts_bind ts_chain

### ** Examples

ts_bind(ts_span(mdeaths, end = "1975-12-01"), fdeaths)
ts_bind(mdeaths, c(2, 2))
ts_bind(mdeaths, 3, ts_bind(fdeaths, c(99, 2)))
ts_bind(ts_dt(mdeaths), AirPassengers)

# numeric vectors
ts_bind(12, AirPassengers, c(2, 3))

ts_chain(ts_span(mdeaths, end = "1975-12-01"), fdeaths)
## No test: 
ts_plot(ts_pc(ts_c(
  comb = ts_chain(ts_span(mdeaths, end = "1975-12-01"), fdeaths),
  fdeaths
)))
## End(No test)



