library(s2dverification)


### Name: PlotVsLTime
### Title: Plots A Score Along The Forecast Time With Its Confidence
###   Interval
### Aliases: PlotVsLTime
### Keywords: dynamic

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
runmean_months <- 12
dim_to_smooth <- 4  # Smooth along lead-times
smooth_ano_exp <- Smoothing(ano_exp, runmean_months, dim_to_smooth)
smooth_ano_obs <- Smoothing(ano_obs, runmean_months, dim_to_smooth)
dim_to_mean <- 2  # Mean along members
required_complete_row <- 3  # Discard startdates for which there are NA leadtimes
leadtimes_per_startdate <- 60
corr <- Corr(Mean1Dim(smooth_ano_exp, dim_to_mean), 
             Mean1Dim(smooth_ano_obs, dim_to_mean), 
             compROW = required_complete_row, 
             limits = c(ceiling((runmean_months + 1) / 2), 
                        leadtimes_per_startdate - floor(runmean_months / 2)))
PlotVsLTime(corr, toptitle = "correlations", ytitle = "correlation", 
            monini = 11, limits = c(-1, 2), listexp = c('CMIP5 IC3'), 
            listobs = c('ERSST'), biglab = FALSE, hlines = c(-1, 0, 1), 
            fileout = 'tos_cor.eps')



