library(mtk)


### Name: getType-methods
### Title: The 'getType' method
### Aliases: getType-methods getType

### ** Examples

# Define a factor
	x1 <- make.mtkFactor(name="x1", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
	
# Return the data-type associated with the factor
	t <- getType(x1)
	
# Create an object of the 'mtkFeature' class.

f <- mtkFeature(name="x", type="double", val=0.0)

# Return the data-type associated with the feature

getType(f) # gives 'double'



