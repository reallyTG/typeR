library(umx)


### Name: umxRAM2Ordinal
### Title: umxRAM2Ordinal
### Aliases: umxRAM2Ordinal

### ** Examples

## Not run: 
##D data(twinData)
##D # Cut to form category of 20% obese subjects
##D obesityLevels   = c('normal', 'obese')
##D cutPoints       = quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
##D twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
##D twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
##D ordDVs = c("obese1", "obese2")
##D twinData[, ordDVs] = umxFactor(twinData[, ordDVs])
##D mzData = twinData[twinData$zygosity %in% "MZFF",]
##D m1 = umxRAM("tim", data = mzData,
##D umxPath("bmi1", with = "bmi2"),
##D umxPath(v.m.= c("bmi1", "bmi2"))
##D )
##D 
##D m1 = umxRAM("tim", data = mzData,
##D 	umxPath("obese1", with = "obese2"),
##D 	umxPath(v.m.= c("obese1", "obese2"))
##D )
## End(Not run)



