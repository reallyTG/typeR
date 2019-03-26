library(s2dverification)


### Name: RMSSS
### Title: Computes Root Mean Square Skill Score
### Aliases: RMSSS .RMSSS
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
rmsss <- RMSSS(Mean1Dim(ano_exp, 2), Mean1Dim(ano_obs, 2))
rmsss_plot <- array(dim = c(dim(rmsss)[1:2], 4, dim(rmsss)[4]))
rmsss_plot[, , 2, ] <- rmsss[, , 1, ]
rmsss_plot[, , 4, ] <- rmsss[, , 2, ]
PlotVsLTime(rmsss_plot, toptitle = "Root Mean Square Skill Score", ytitle = "", 
            monini = 11, limits = c(-1, 1.3), listexp = c('CMIP5 IC3'), 
            listobs = c('ERSST'), biglab = FALSE, hlines = c(-1, 0, 1), 
            fileout = 'tos_rmsss.eps')
# The following example uses veriApply combined with .RMSSS instead of RMSSS
  ## Not run: 
##D require(easyVerification)
##D RMSSS2 <- s2dverification:::.RMSSS
##D rmsss2 <- veriApply("RMSSS2", ano_exp,
##D                     # see ?veriApply for how to use the 'parallel' option
##D                     Mean1Dim(ano_obs, 2),
##D                     tdim = 3, ensdim = 2)
##D   
## End(Not run)



