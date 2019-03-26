library(TSstudio)


### Name: ts_to_prophet
### Title: Transform Time Series Object to Prophet input
### Aliases: ts_to_prophet

### ** Examples


data(USgas)

ts_to_prophet(ts.obj = USgas)

# If known setting the start date of the input object

ts_to_prophet(ts.obj = USgas, start = as.Date("2000-01-01"))




