library(mtk)


### Name: setParameters-methods
### Title: The 'setParameters' method
### Aliases: setParameters-methods setParameters

### ** Examples

# Create a process for experiments design

	designer <- mtkNativeDesigner(design ="Morris")
	
# Create a list of mtkParameter for the parameters: min, max, shape.
	p <- make.mtkParameterList(list(size=20))

# Assign the parameters to the process

	setParameters(designer, p)
	
	



