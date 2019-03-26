library(mtk)


### Name: mtkParameter
### Title: The constructor of the class 'mtkParameter'
### Aliases: mtkParameter

### ** Examples

# Create an object of the 'mtkParameter' class.

p <- mtkParameter(name="x", type="double", val=0.0)

# We usually use the 'make.mtkParameterList()' function to define 
# a list of 'mtkParameter' instead of the constructor 
# of the 'mtkParameter' class
	flist <- make.mtkParameterList(x=list(min=-1,max=+1))




