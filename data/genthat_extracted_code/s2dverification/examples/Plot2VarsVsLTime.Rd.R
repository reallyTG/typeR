library(s2dverification)


### Name: Plot2VarsVsLTime
### Title: Plot Two Scores With Confidence Intervals In A Common Plot
### Aliases: Plot2VarsVsLTime
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
required_complete_row <- 3  # Discard start dates that contain NA along lead-times
leadtimes_per_startdate <- 60
rms <- RMS(Mean1Dim(smooth_ano_exp, dim_to_mean), 
           Mean1Dim(smooth_ano_obs, dim_to_mean), 
           compROW = required_complete_row, 
           limits = c(ceiling((runmean_months + 1) / 2), 
                      leadtimes_per_startdate - floor(runmean_months / 2)))
smooth_ano_exp_m_sub <- smooth_ano_exp - InsertDim(Mean1Dim(smooth_ano_exp, 2, 
                        narm = TRUE), 2, dim(smooth_ano_exp)[2])
spread <- Spread(smooth_ano_exp_m_sub, c(2, 3))  
Plot2VarsVsLTime(InsertDim(rms[, , , ], 1, 1), spread$sd, 
                 toptitle = 'RMSE and spread', monini = 11, freq = 12, 
                 listexp = c('CMIP5 IC3'), listvar = c('RMSE', 'spread'),
                 fileout = 'plot2vars.eps')



