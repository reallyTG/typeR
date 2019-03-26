library(mtk)


### Name: getMTKFeatures-methods
### Title: The 'getMTKFeatures' method
### Aliases: getMTKFeatures-methods getMTKFeatures

### ** Examples

# Define a factor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))

# Define a list of features and associate it with the factor
	features <- make.mtkFeatureList(list(pre=5, post=60))
	setFeatures(x1, features)

# Return the features associated with the factor
	fl <- getMTKFeatures(x1)



