library(Interpol.T)


### Name: shape_calibration
### Title: Calibrates the shape of the night interpolating curve
### Aliases: shape_calibration

### ** Examples

library(Interpol.T)
data(Trentino_hourly_T)

stations <- c("T0001","T0010","T0129")

calibration_shape <- shape_calibration(meas = h_d_t[h_d_t$V1 %in% stations,],
						cal_times_list = calibration_l[stations],
                     band_min = 0:23, band_max = 0:23, ratio_dtr_range = c(0,4),
						min_mo.length=21)



