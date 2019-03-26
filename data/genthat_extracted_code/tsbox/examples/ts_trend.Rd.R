library(tsbox)


### Name: ts_trend
### Title: Loess Trend Estimation
### Aliases: ts_trend

### ** Examples

## No test: 
ts_plot(
   `Raw series` = fdeaths, 
   `Loess trend` = ts_trend(fdeaths),
   title = "Deaths from Lung Diseases",
   subtitle = "per month"
)
## End(No test)



