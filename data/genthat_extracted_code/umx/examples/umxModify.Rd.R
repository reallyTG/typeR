library(umx)


### Name: umxModify
### Title: umxModify: Add, set, or drop model paths by label.
### Aliases: umxModify

### ** Examples

require(umx)

# First we'll just build a 1-factor model
umx_set_optimizer("SLSQP")
data(demoOneFactor)
latents  = c("G")
manifests = names(demoOneFactor)

m1 <- umxRAM("One Factor", data = mxData(cov(demoOneFactor), type = "cov", numObs = 500),
	umxPath(latents, to = manifests),
	umxPath(var = manifests),
	umxPath(var = latents, fixedAt = 1)
)

# 1. Drop the path to x1 (also updating the name so it's
#    self-explanatory, and get a fit comparison
m2 = umxModify(m1, update = "G_to_x1", name = "drop_X1", comparison = TRUE)
# 2. Add the path back (setting free = TRUE)
m2 = umxModify(m1, update = "G_to_x1", free= TRUE, name = "addback_X1", comparison = TRUE)
# 3. Fix a value at a non-zero value
m3 = umxModify(m1, update = "G_to_x1", value = .35, name = "fix_G_x1_at_35", comp = TRUE)
# You can add objects to models. For instance this would add a path (overwriting the existing one)
# (thanks Johannes!)
m3 = umxModify(m1, umxPath("G", with = "x1"), name= "addedPath")

# Use regular expression to drop multiple paths: e.g. G to x3, x4, x5
m2 = umxModify(m1, regex = "^G_to_x[3-5]", name = "no_G_to_x3_5", comp = TRUE)

# Same, but don't autoRun
m2 = umxModify(m1, regex  = "^G_to_x[3-5]", name = "no_G_to_x3_5", autoRun = FALSE) 

# Re-write a label
newLabel = "A_rose_by_any_other_name"
newModelName = "model_doth_smell_as_sweet"
m2 = umxModify(m1, update = "G_to_x1", newlabels= newLabel, name = newModelName, comparison = TRUE)
# Change labels in 2 places
labsToUpdate = c("G_to_x1", "G_to_x2")
newLabel = "G_to_1_or_2"
m2 = umxModify(m1, update = labsToUpdate, newlabels= newLabel, name = "equated", comparison = TRUE)

# Advanced!
# Regular expressions let you use pieces of the old names in creating new ones!
searchString = "G_to_x([0-9])"
newLabel = "loading_for_path\\1" # use value in regex group 1
m2 = umxModify(m1, regex = searchString, newlabels= newLabel, name = "grep", comparison = TRUE)




