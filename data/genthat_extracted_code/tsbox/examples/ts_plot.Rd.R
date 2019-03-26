library(tsbox)


### Name: ts_plot
### Title: Plot Time Series
### Aliases: ts_plot

### ** Examples

## No test: 
ts_plot(
  AirPassengers, 
  title = "Airline passengers",
  subtitle = "The classic Box & Jenkins airline data"
)
 
# naming arguments
ts_plot(total = ldeaths, female = fdeaths, male = mdeaths)

# using different ts-boxable objects
ts_plot(ts_scale(ts_c(
  ts_xts(airmiles), 
  ts_tbl(co2), 
  JohnsonJohnson, 
  ts_df(discoveries)
)))

# customize ts_plot
op <- options(
  tsbox.lwd = 3, 
  tsbox.col = c("gray51", "gray11"), 
  tsbox.lty = "dashed"
)
ts_plot(
  "Female" = fdeaths,
  "Male" = mdeaths
)
options(op)  # restore defaults
## End(No test)



