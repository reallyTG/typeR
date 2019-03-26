library(mtk)


### Name: mtkParameter-class
### Title: The 'mtkParameter' class
### Aliases: mtkParameter-class getName,mtkParameter-method
###   getValue,mtkParameter-method getType,mtkParameter-method
###   setType,mtkParameter,character-method
###   setName,mtkParameter,character-method
###   setValue,mtkParameter,ANY-method show,mtkParameter-method
###   print,mtkParameter-method

### ** Examples

# Create an object of the 'mtkParameter' class.

	p <- mtkParameter(name="x", type="double", val=0.0)

# We usually use the 'make.mtkParameterList()' function to define a list of
# 'mtkParameter' instead of the constructor 
# of the 'mtkParameter' class
	plist <- make.mtkParameterList(list(min=-1,max=+1,shape="hello"))



