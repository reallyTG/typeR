library(MLDS)


### Name: boot.mlds
### Title: Resampling of an Estimated Difference Scale
### Aliases: boot.mlds boot.mlbs
### Keywords: datagen misc

### ** Examples

data(kk1)
	kk1.mlds <- mlds(kk1)
	#nsim should be near 10,000 for stability,
	# but this will take a little time
	boot.mlds(kk1.mlds, 100)



