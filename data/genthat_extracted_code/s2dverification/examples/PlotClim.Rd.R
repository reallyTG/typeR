library(s2dverification)


### Name: PlotClim
### Title: Plots Climatologies
### Aliases: PlotClim
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
PlotClim(clim$clim_exp, clim$clim_obs, toptitle = paste('climatologies'), 
         ytitle = 'K', monini = 11, listexp = c('CMIP5 IC3'), 
         listobs = c('ERSST'), biglab = FALSE, fileout = 'tos_clim.eps')



