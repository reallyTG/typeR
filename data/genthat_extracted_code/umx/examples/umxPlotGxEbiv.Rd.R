library(umx)


### Name: umxPlotGxEbiv
### Title: Plot the results of a GxE univariate test for moderation of ACE
###   components.
### Aliases: umxPlotGxEbiv plot.MxModelGxEbiv

### ** Examples

require(umx)
data(twinData)
## Not run: 
##D selDVs  = "wt"; selDefs = "ht"
##D df = umx_scale_wide_twin_data(twinData, varsToScale = c("ht", "wt"), suffix = "")
##D mzData  = subset(df, zygosity %in%  c("MZFF", "MZMM"))
##D dzData  = subset(df, zygosity %in%  c("DZFF", "DZMM", "DZOS"))
##D 
##D m1 = umxGxEbiv(selDVs = selDVs, selDefs = selDefs, 
##D 	dzData = dzData, mzData = mzData, sep = "", dropMissingDef = TRUE)
##D # Plot Moderation
##D plot(m1)
##D umxPlotGxEbiv(m1, xlab = "wt", separateGraphs = TRUE, location = "topleft")
## End(Not run)



