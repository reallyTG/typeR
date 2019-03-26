library(umx)


### Name: umx
### Title: Helper Functions for Structural Equation Modeling in OpenMx
### Aliases: umx umx-package

### ** Examples

require("umx")
data(demoOneFactor)
myData = mxData(cov(demoOneFactor), type = "cov", numObs = nrow(demoOneFactor))
latents = c("G")
manifests = names(demoOneFactor)
m1 <- umxRAM("One Factor", data = myData,
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents  , fixedAt=1)
)

# umx added informative labels, created starting values, 
# Ran you model (if autoRun is on), and displayed a brief summary
# including a comparison if you modified a model...!

# Let's get some journal-ready fit information

umxSummary(m1) 
umxSummary(m1, show = "std") #also display parameter estimates 
# You can get the coefficients of an MxModel with coef(), just like for lm etc.
coef(m1)

# ==================
# = Model updating =
# ==================
# Can we set the loading of X5 on G to zero?
m2 = omxSetParameters(m1, labels = "G_to_x1", values = 0, free = FALSE, name = "no_g_on_X5")
m2 = mxRun(m2)
# Compare the two models
umxCompare(m1, m2)

# Use umxModify to do the same thing in 1-line
m2 = umxModify(m1, "G_to_x1", name = "no_effect_of_g_on_X5", comparison = TRUE)

# ========================
# = Confidence intervals =
# ========================

# umxSummary() will show these, but you can also use the confint() function
confint(m1) # OpenMx's SE-based confidence intervals
umxConfint(m1, parm = 'all', run = TRUE) # likelihood-based CIs

# And make a Figure in dot (.gv) format!
plot(m1, std = TRUE)

# If you just want the .dot code returned set file = NA
plot(m1, std = TRUE, file = NA)



