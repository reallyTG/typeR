library(Interpol.T)


### Name: bias
### Title: Calculates mean bias (difference between (max+min)/2 and 24-hour
###   averages) in mean daily temperature series
### Aliases: bias

### ** Examples

data(Trentino_hourly_T)
mo_bias <- bias(TMIN = Tn, TMAX = Tx, TMEAN = Tm_list, min_valid = 20)



