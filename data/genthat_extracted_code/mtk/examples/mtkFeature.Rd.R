library(mtk)


### Name: mtkFeature
### Title: The constructor of the class 'mtkFeature'
### Aliases: mtkFeature

### ** Examples

# creates a feature "he"
	f <- mtkFeature(name='he', type ='character', val = 'pekin')
	
# We usually use the 'make.mtkFeatureList()' function to define 
# a list of 'mtkFeature' instead of the constructor 
# of the 'mtkFeature' class

	flist <- make.mtkFeatureList(list(min=-1,max=+1,shape="hello"))



