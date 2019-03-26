library(processcontrol)


### Name: six_sigma_ctrl_chart
### Title: Generate IndX and mR charts.
### Aliases: six_sigma_ctrl_chart

### ** Examples

data("spcTimeSeries")
six_sigma_ctrl_chart(spcTimeSeries)
six_sigma_ctrl_chart(spcTimeSeries, verbose=TRUE)
six_sigma_ctrl_chart(spcTimeSeries, seg=c(25, 50, 75))
six_sigma_ctrl_chart(spcTimeSeries, seg=c(25, 50, 75), keepStats=FALSE, verbose=TRUE)



