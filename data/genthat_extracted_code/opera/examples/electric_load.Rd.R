library(opera)


### Name: electric_load
### Title: Electricity forecasting data set
### Aliases: electric_load
### Keywords: datasets

### ** Examples

 data(electric_load)
 # a few graphs to display the data
 attach(electric_load)
 plot(Load, type = 'l')
 plot(Temp, Load, pch = 16, cex = 0.5)
 plot(NumWeek, Load, pch = 16, cex = 0.5)
 plot(Load, Load1, pch = 16, cex = 0.5)
 acf(Load, lag.max = 20)
 detach(electric_load)



