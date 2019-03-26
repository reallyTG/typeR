library(Interpol.T)


### Name: Th_int_series
### Title: Hourly interpolation of multiple daily temperature series
### Aliases: Th_int_series

### ** Examples

library(Interpol.T)
data(Trentino_hourly_T)
stations <- c("T0001","T0010","T0129")
# interpolation of temperature for series T0001 and T0129, from 2004 to 2005
Th_int_list <- Th_int_series(cal_times = calibration_l,
						cal_shape = calibration_shape,
					    TMIN=Tn, TMAX=Tx,
                     start_year = 2004, end_year = 2005,
						active_IDs = stations)



