library(umx)


### Name: umxLatent
### Title: umxLatent: Helper to ease making formative and reflective latent
###   variables
### Aliases: umxLatent

### ** Examples

library(umx)
data(demoOneFactor)
latents = c("G")
manifests = names(demoOneFactor) # x1-5
theData = cov(demoOneFactor)
df = mxData(theData, type = "cov", numObs = nrow(demoOneFactor))
m1 = umxRAM("reflective", data = df,
	umxLatent("G", forms = manifests, type = "exogenous", data = theData)
)
umxSummary(m1, show="std")
plot(m1, std = TRUE)

## Not run: 
##D # I don't recommend using umxLatent at present: It's not a direction I am moving umx in
##D m2 = umxRAM("formative", data = df,
##D umxLatent("G", formedBy = manifests, data = df, fixManifestVariances=TRUE)
##D )
##D umxSummary(m2, show = "std")
##D plot(m2, std = TRUE)
## End(Not run)



