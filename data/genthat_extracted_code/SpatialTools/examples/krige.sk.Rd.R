library(SpatialTools)


### Name: krige.sk
### Title: Performs simple kriging
### Aliases: krige.sk
### Keywords: kriging simple kriging simple

### ** Examples

	data(toydata)
	y <- as.vector(toydata$y)
	V <- toydata$V
	Vp <- toydata$Vp
	Vop <- toydata$Vop
	krige.sk(y, V, Vp, Vop, m = 2)



