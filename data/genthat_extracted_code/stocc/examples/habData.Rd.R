library(stocc)


### Name: habData
### Title: A simulated data set of environmental covariates
### Aliases: habData
### Keywords: datasets

### ** Examples

data(habData)
image(x=seq(0.5,39.5,1), y=seq(0.5,39.5,1),
	z=t(matrix(as.numeric(habData$habCov1),40)), main="habData: Factor environmental covariate",
	xlab="x", ylab="y", col=rainbow(3))


dev.new()
image(x=seq(0.5,39.5,1), y=seq(0.5,39.5,1),
	z=t(matrix(habData$habCov2,40)), main="habData: Continuous environmental covariate",
	xlab="x", ylab="y", col=terrain.colors(50))



