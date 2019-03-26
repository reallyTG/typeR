library(umx)


### Name: umxConfint
### Title: Get confidence intervals from a umx model
### Aliases: umxConfint

### ** Examples

require(umx)
data(demoOneFactor)
latents = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(from = latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)

m1 = umxConfint(m1, run = TRUE) # There are no existing CI requests...

# Add a CI request for "G_to_x1", run, and report. Save with this CI computed
m2 = umxConfint(m1, parm = "G_to_x1", run = TRUE) 

# Just print out any existing CIs
umxConfint(m2) 

# CI requests added for free matrix parameters. User prompted to set run = TRUE
m3 = umxConfint(m1, "all")

# Run the requested CIs
m3 = umxConfint(m3, run = TRUE) 

# Run CIs for free one-headed (asymmetric) paths in RAM model. 
#   note: Deletes other existing requests,
tmp = umxConfint(m1, parm = "A", run = TRUE)

# Wipe existing CIs, add G_to_x1
tmp = umxConfint(m1, parm = "G_to_x1", run = TRUE, wipeExistingRequests = TRUE) 

## Not run: 
##D # For complex twin models, where algebras have parameters in some cells, smart might help
##D # note: only implemented for umxCP so far
##D m2 =  umxConfint(m1, "smart")
## End(Not run)




