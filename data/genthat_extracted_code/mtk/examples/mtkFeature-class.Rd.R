library(mtk)


### Name: mtkFeature-class
### Title: The 'mtkFeature' class
### Aliases: mtkFeature-class getName,mtkFeature-method
###   getValue,mtkFeature-method getType,mtkFeature-method
###   setName,mtkFeature,character-method setValue,mtkFeature,ANY-method
###   setType,mtkFeature,character-method show,mtkFeature-method
###   print,mtkFeature-method

### ** Examples

# Create an object of the 'mtkFeature' class.

f <- mtkFeature(name="x", type="double", val=0.0)

# We usually use the make.mtkFeatureList function to define a list of mtkFeature
# instead of the constructor of the mtkFeature class

	flist <- make.mtkFeatureList(list(min=-1,max=+1,shape="hello"))



