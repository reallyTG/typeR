library(Interpol.T)


### Name: plot_meas_sim
### Title: Plots hourly curves
### Aliases: plot_meas_sim

### ** Examples

data(Trentino_hourly_T)
stations <- c("T0001","T0010","T0129")
plot_meas_sim(meas = h_d_t, sim = Th_int_list, series=stations,
              missing_code = -999.9, chart.start = "1Feb2004",
             chart.end = "29Feb2004", leg.pos = "top")



