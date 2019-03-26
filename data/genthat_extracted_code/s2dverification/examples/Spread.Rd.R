library(s2dverification)


### Name: Spread
### Title: Computes InterQuartile Range, Maximum-Minimum, Standard
###   Deviation and Median Absolute Deviation of the Ensemble Members
### Aliases: Spread
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
runmean_months <- 12
dim_to_smooth <- 4  # Smooth along lead-times
smooth_ano_exp <- Smoothing(ano_exp, runmean_months, dim_to_smooth)
smooth_ano_exp_m_sub <- smooth_ano_exp - InsertDim(Mean1Dim(smooth_ano_exp, 2, 
                        narm = TRUE), 2, dim(smooth_ano_exp)[2])
spread <- Spread(smooth_ano_exp_m_sub, c(2, 3))
PlotVsLTime(spread$iqr, 
            toptitle = "Inter-Quartile Range between ensemble members",
            ytitle = "K", monini = 11, limits = NULL, 
            listexp = c('CMIP5 IC3'), listobs = c('ERSST'), biglab = FALSE, 
            hlines = c(0), fileout = 'tos_iqr.eps')
PlotVsLTime(spread$maxmin, toptitle = "Maximum minus minimum of the members", 
            ytitle = "K", monini = 11, limits = NULL, 
            listexp = c('CMIP5 IC3'), listobs = c('ERSST'), biglab = FALSE, 
            hlines = c(0), fileout = 'tos_maxmin.eps')
PlotVsLTime(spread$sd, toptitle = "Standard deviation of the members", 
            ytitle = "K", monini = 11, limits = NULL, 
            listexp = c('CMIP5 IC3'), listobs = c('ERSST'), biglab = FALSE, 
            hlines = c(0), fileout = 'tos_sd.eps')
PlotVsLTime(spread$mad, toptitle = "Median Absolute Deviation of the members",
            ytitle = "K", monini = 11, limits = NULL, 
            listexp = c('CMIP5 IC3'), listobs = c('ERSST'), biglab = FALSE, 
            hlines = c(0), fileout = 'tos_mad.eps')



