library(s2dverification)


### Name: RatioSDRMS
### Title: Computes the ratio between the ensemble spread and RMSE
### Aliases: RatioSDRMS .RatioSDRMS
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
rsdrms <- RatioSDRMS(sampleData$mod, sampleData$obs)
# Reorder the data in order to plot it with PlotVsLTime
rsdrms_plot <- array(dim = c(dim(rsdrms)[1:2], 4, dim(rsdrms)[4]))
rsdrms_plot[, , 2, ] <- rsdrms[, , 1, ]
rsdrms_plot[, , 4, ] <- rsdrms[, , 2, ]
PlotVsLTime(rsdrms_plot, toptitle = "Ratio ensemble spread / RMSE", ytitle = "", 
            monini = 11, limits = c(-1, 1.3), listexp = c('CMIP5 IC3'), 
            listobs = c('ERSST'), biglab = FALSE, siglev = TRUE, 
            fileout = 'tos_rsdrms.eps')

# The following example uses veriApply combined with .RatioSDRMS instead of RatioSDRMS
  ## Not run: 
##D require(easyVerification)  
##D RatioSDRMS2 <- s2dverification:::.RatioSDRMS
##D rsdrms2 <- veriApply("RatioSDRMS2",
##D                      sampleData$mod,
##D                      # see ?veriApply for how to use the 'parallel' option
##D                      Mean1Dim(sampleData$obs, 2),
##D                      tdim = 3, ensdim = 2)
##D   
## End(Not run)



