library(mtk)


### Name: setName-methods
### Title: The 'setName' method
### Aliases: setName-methods setName

### ** Examples


# Define a factor
	x1 <- make.mtkFactor(name="x1", type="double", distribName="unif",
		 distribPara=list(min=-pi, max=pi))
		 
# Change the numeric value of the factor to "numeric" type.

	setName(x1, name="mit")
	
# Create a  new object of mtkValue
d <- mtkValue("a", "double", 0)

# Change the name of the object to "x" type.
setName(d, "x")



