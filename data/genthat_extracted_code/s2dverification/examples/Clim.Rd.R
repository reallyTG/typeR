library(s2dverification)


### Name: Clim
### Title: Computes Bias Corrected Climatologies
### Aliases: Clim
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
PlotClim(clim$clim_exp, clim$clim_obs, 
         toptitle = paste('sea surface temperature climatologies'), 
         ytitle = 'K', monini = 11, listexp = c('CMIP5 IC3'), 
         listobs = c('ERSST'), biglab = FALSE, fileout = 'tos_clim.eps')



