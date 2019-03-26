library(Interpol.T)


### Name: par_calibration
### Title: Calibration of "hour" parameters for temperature interpolation
### Aliases: par_calibration

### ** Examples

data(Trentino_hourly_T)
stations <- c("T0001","T0010","T0129")

calibration_l <- par_calibration(meas = h_d_t[h_d_t$V1 %in% stations,],
                 missing_value_code = -999.9,
					band_min = 4:8, band_max = 13:16,
					band_suns = 16:20, cal_period = NULL)



