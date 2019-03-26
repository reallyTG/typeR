library(umx)


### Name: umxGxE
### Title: umxGxE: Implements ACE models with moderation of paths, e.g. by
###   SES.
### Aliases: umxGxE

### ** Examples

require(umx)
data(twinData) 
umx_set_optimizer("SLSQP")
twinData$age1 = twinData$age2 = twinData$age
selDVs  = "bmi"
selDefs = "age"
mzData  = subset(twinData, zygosity == "MZFF")[100,]
dzData  = subset(twinData, zygosity == "DZFF")[100,]
umx_time("start")
m1 = umxGxE(selDVs = "bmi", selDefs = "age", sep = "", dzData = dzData, mzData = mzData, 
			dropMissingDef = TRUE, tryHard = "mxTryHard")
umx_time("stop")

## Not run: 
##D # Controlling umxSummary
##D umxSummaryGxE(m1)
##D umxSummary(m1, location = "topright")
##D umxSummary(m1, separateGraphs = TRUE)
##D 
##D m2 = umxModify(m1, regex = "am_.*", comparison = TRUE, tryHard = "mxTryHard")
##D 
##D # umxReduce knows how to test all relevant hypotheses for GxE models,
##D # reporting these in a nice table.
##D umxReduce(m1)
## End(Not run)



