library(mtk)


### Name: setFeatures-methods
### Title: The 'setFeatures' method
### Aliases: setFeatures-methods setFeatures

### ** Examples


# Build an object of the "mtkFactor" class
	x1 <- make.mtkFactor(name="x1", type="double", nominal=0, distribName="unif",
		 distribPara=list(min=-pi, max=pi))
# Define the list of features
	f <- make.mtkFeatureList(list(f=4.5,c=+6,shape="parabolic"))
	
# Assign the features to the factor

	setFeatures(x1,f)



