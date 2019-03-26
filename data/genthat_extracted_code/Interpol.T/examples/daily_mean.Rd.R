library(Interpol.T)


### Name: daily_mean
### Title: Production of daily means from hourly temperature series
### Aliases: daily_mean

### ** Examples

data(Trentino_hourly_T)
# generates daily means for series T0001 and T0129:
Tm_list <- daily_mean(hourly_list = Th_int_list, series_names = c("T0001", "T0129"))



