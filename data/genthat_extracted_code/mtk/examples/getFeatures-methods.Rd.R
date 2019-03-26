library(mtk)


### Name: getFeatures-methods
### Title: The 'getFeatures' method
### Aliases: getFeatures-methods getFeatures

### ** Examples

# Define a factor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))

# Define a list of features and associate it with the factor
	features <- make.mtkFeatureList(list(pre=5, post=60))
	setFeatures(x1, features)

# Return the features associated with the factor
	fl <- getFeatures(x1)



