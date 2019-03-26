library(s2dverification)


### Name: Consist_Trend
### Title: Computes Trends Using Only Model Data For Which Observations Are
###   Available
### Aliases: Consist_Trend
### Keywords: datagen

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
years_between_startdates <- 5
trend <- Consist_Trend(Mean1Dim(smooth_ano_exp, dim_to_mean), 
                       Mean1Dim(smooth_ano_obs, dim_to_mean), 
                       years_between_startdates)

PlotVsLTime(trend$trend, toptitle = "trend", ytitle = "K/(5 years)", 
            monini = 11, limits = c(-0.8, 0.8), listexp = c('CMIP5 IC3'), 
            listobs = c('ERSST'), biglab = FALSE, hlines = c(0), 
            fileout = 'tos_consist_trend.eps')
PlotAno(InsertDim(trend$detrendedmod,2,1), InsertDim(trend$detrendedobs,2,1), 
        startDates, "Detrended tos anomalies", ytitle = 'K', 
        legends = 'ERSST', biglab = FALSE, fileout = 'tos_detrended_ano.eps')



