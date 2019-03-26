library(s2dverification)


### Name: PlotAno
### Title: Plot Raw Or Smoothed Anomalies
### Aliases: PlotAno
### Keywords: dynamic

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
runmean_nb_months <- 12
dim_to_smooth <- 4  # Smooth along lead-times
smooth_ano_exp <- Smoothing(ano_exp, runmean_nb_months, dim_to_smooth)
smooth_ano_obs <- Smoothing(ano_obs, runmean_nb_months, dim_to_smooth)
PlotAno(smooth_ano_exp, smooth_ano_obs, startDates, 
        toptitle = paste('smoothed anomalies'), ytitle = c('K', 'K', 'K'), 
        legends = 'ERSST', biglab = FALSE, fileout = 'tos_ano.eps')



