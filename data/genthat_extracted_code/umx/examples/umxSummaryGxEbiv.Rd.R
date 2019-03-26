library(umx)


### Name: umxSummaryGxEbiv
### Title: Summarize a bivariate GxE twin model
### Aliases: umxSummaryGxEbiv umxSummary.MxModelGxEbiv

### ** Examples

data(twinData) 
selDVs  = "wt"
selDefs = "ht"
df = umx_scale_wide_twin_data(twinData, varsToScale = c("ht", "wt"), sep = "")
mzData  = subset(df, zygosity %in%  c("MZFF", "MZMM"))
dzData  = subset(df, zygosity %in%  c("DZFF", "DZMM", "DZOS"))

## Not run: 
##D m1 = umxGxEbiv(selDVs = selDVs, selDefs = selDefs, 
##D 	dzData = dzData, mzData = mzData, sep = "", dropMissingDef = TRUE)
##D # Plot Moderation
##D umxSummary(m1)
##D umxSummary(m1, location = "topright")
##D umxSummary(m1, separateGraphs = FALSE)
## End(Not run)



