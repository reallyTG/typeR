library(umx)


### Name: umxCI
### Title: Add (and, optionally, run) confidence intervals to a structural
###   model.
### Aliases: umxCI

### ** Examples

require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)
m1$intervals # none yet - empty list()
m1 = umxCI(m1)
m1$intervals # $G_to_x1
m1 = umxCI(m1, remove = TRUE) # remove CIs from the model and return it

# ========================
# = A twin model example =
# ========================
data(twinData) 
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACE(selDVs = c("bmi1","bmi2"), dzData = dzData, mzData = mzData)
## Not run: 
##D umxCI(m1, run = "show") # show what will be requested
##D umxCI(m1, run = "yes") # actually compute the CIs
##D # Don't force update of CIs, but if they were just added, then calculate them
##D umxCI(m1, run = "if necessary")
##D m1 = umxCI(m1, remove = TRUE) # remove them all
##D m1$intervals # none!
##D # Show what parameters are available to get CIs on
##D umxParameters(m1) 
##D # Request a CI by label:
##D m1 = umxCI(m1, "a_r1c1", run = "yes")
## End(Not run)



