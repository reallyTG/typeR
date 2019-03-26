library(MSEtool)


### Name: plot_timeseries
### Title: Plot time series of data
### Aliases: plot_timeseries

### ** Examples

data(Red_snapper)
plot_timeseries(Red_snapper@Year, Red_snapper@Cat[1, ],
obs_CV = Red_snapper@CV_Cat, label = "Catch")



