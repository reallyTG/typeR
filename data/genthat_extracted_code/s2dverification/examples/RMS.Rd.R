library(s2dverification)


### Name: RMS
### Title: Computes Root Mean Square Error
### Aliases: RMS .RMS
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
# Discard start-dates for which some leadtimes are missing
required_complete_row <- 3
leadtimes_per_startdate <- 60
rms <- RMS(Mean1Dim(smooth_ano_exp, dim_to_mean), 
           Mean1Dim(smooth_ano_obs, dim_to_mean), 
           compROW = required_complete_row, 
           limits = c(ceiling((runmean_months + 1) / 2), 
                      leadtimes_per_startdate - floor(runmean_months / 2)))
PlotVsLTime(rms, toptitle = "Root Mean Square Error", ytitle = "K", 
            monini = 11, limits = NULL, listexp = c('CMIP5 IC3'), 
            listobs = c('ERSST'), biglab = FALSE, hlines = c(0), 
            fileout = 'tos_rms.eps')
# The following example uses veriApply combined with .RMS instead of RMS
  ## Not run: 
##D require(easyVerification)
##D RMS2 <- s2dverification:::.RMS
##D rms2 <- veriApply("RMS2",
##D                   smooth_ano_exp,
##D                   # see ?veriApply for how to use the 'parallel' option
##D                   Mean1Dim(smooth_ano_obs, dim_to_mean),
##D                   tdim = 3, ensdim = 2)
##D   
## End(Not run)



