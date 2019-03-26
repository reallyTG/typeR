library(umx)


### Name: umxLabel
### Title: umxLabel: Add labels to a RAM model, matrix, or path
### Aliases: umxLabel

### ** Examples

# ==============================================================
# = Show how OpenMx models are not labels, and then add labels =
# ==============================================================
require(umx)
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)
m1 <- mxModel("One Factor", type = "RAM",
	manifestVars = manifests, latentVars = latents, 
	mxPath(from = latents, to = manifests),
	mxPath(from = manifests, arrows = 2),
	mxPath(from = latents, arrows = 2, free = FALSE, values = 1),
	mxData(cov(demoOneFactor), type = "cov", numObs = 500)
)
umxGetParameters(m1) # Default "matrix address" labels, i.e "One Factor.S[2,2]"
m1 = umxLabel(m1)
umxGetParameters(m1, free = TRUE) # Informative labels: "G_to_x1", "x4_with_x4", etc.
# =======================================================================
# = Create a new model, with suffixes added to paths, and model renamed =
# =======================================================================
m2 = umxLabel(m1, suffix= "_male", overRideExisting= TRUE, name = "male_model")
umxGetParameters(m2, free = TRUE) # suffixes added

# =============================
# = Example Labeling a matrix =
# =============================
a = umxLabel(mxMatrix(name = "a", "Full", 3, 3, values = 1:9))
a$labels
# note: labels with "data." in the name are left untouched!
a = mxMatrix(name = "a", "Full", 1,3, labels = c("data.a", "test", NA))
umxLabel(a, verbose = TRUE)
umxLabel(a, verbose = TRUE, overRideExisting = FALSE)
umxLabel(a, verbose = TRUE, overRideExisting = TRUE)



