library(umx)


### Name: xmu_twin_check
### Title: Check basic aspects of input for twin models.
### Aliases: xmu_twin_check

### ** Examples

library(umx)
data(twinData)
mzData = subset(twinData, zygosity == "MZFF")
dzData = subset(twinData, zygosity == "MZFF")
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = TRUE)
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = FALSE)
xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, 
	sep = "", enforceSep = TRUE, nSib = 2, optimizer = NULL)
## Not run: 
##D # TODO xmu_twin_check: move to a test file:
##D # 1. stop on no rows
##D xmu_twin_check("Generativity", twinData[NULL,], twinData[NULL,], sep="_T")
##D # Error in xmu_twin_check("Generativity", twinData[NULL, ], twinData[NULL,  : 
##D #   Your DZ dataset has no rows!
##D 
##D # 2. Stop on a NULL sep  = NULL IFF enforceSep = TRUE
##D xmu_twin_check(selDVs = c("wt", "ht"), dzData = dzData, mzData = mzData, enforceSep = TRUE)
##D # 3. stop on a factor with sep = NULL
## End(Not run)



