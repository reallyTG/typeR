library(mtk)


### Name: setType-methods
### Title: The 'setType' method
### Aliases: setType-methods setType

### ** Examples


# Define a factor
	x1 <- make.mtkFactor(name="x1", type="double", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
		 
# Change the numeric value of the factor to "numeric" type.

	setType(x1, type="numeric")
	
# Create a  new object of mtkValue
d <- mtkValue("a", "double", 0)

# Change the numeric value of the object to "numeric" type.
setType(d, "numeric")



