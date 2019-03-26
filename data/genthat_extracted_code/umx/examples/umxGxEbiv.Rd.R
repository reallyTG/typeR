library(umx)


### Name: umxGxEbiv
### Title: Bivariate GxE models where twins differ on the moderator.
### Aliases: umxGxEbiv

### ** Examples

require(umx)
data(twinData)
selDVs  = "wt"
selDefs = "ht"
df = umx_scale_wide_twin_data(twinData, varsToScale = c("ht", "wt"), sep = "")
mzData  = subset(df, zygosity %in%  c("MZFF", "MZMM"))
dzData  = subset(df, zygosity %in%  c("DZFF", "DZMM", "DZOS"))

## Not run: 
##D m1 = umxGxEbiv(selDVs = selDVs, selDefs = selDefs, 
##D 	dzData = dzData, mzData = mzData, sep = "", dropMissingDef = TRUE)
##D 
##D # Plot Moderation
##D umxSummaryGxEbiv(m1)
##D umxSummary(m1, location = "topright")
##D umxSummary(m1, separateGraphs = FALSE)
##D m2 = umxModify(m1, update = c("cBeta2_r1c1", "eBeta1_r1c1", "eBeta2_r1c1"), comparison = TRUE)
##D #
##D # TODO: teach umxReduce to test all relevant hypotheses for umxGxEbiv
##D umxReduce(m1)
## End(Not run)



