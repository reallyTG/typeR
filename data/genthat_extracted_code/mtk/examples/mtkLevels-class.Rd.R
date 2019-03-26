library(mtk)


### Name: mtkLevels-class
### Title: The 'mtkLevels' class
### Aliases: mtkLevels-class getType,mtkLevels-method
###   setType,mtkLevels,character-method getLevels,mtkLevels-method
###   setLevels,mtkLevels,vector-method getWeights,mtkLevels-method
###   setWeights,mtkLevels,numeric-method summary,mtkLevels-method
###   show,mtkLevels-method print,mtkLevels-method

### ** Examples

# Create an object of the class 'mtkLevels'

	l <- mtkLevels(type='categorical', levels=seq(1:3), weight=rep(0.33, 3))

# Set the levels'name to ('a', 'b', 'c')
	
	setLevels(l, levels=c('a', 'b', 'c'))




