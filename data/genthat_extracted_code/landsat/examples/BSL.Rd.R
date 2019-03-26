library(landsat)


### Name: BSL
### Title: Bare Soil Line
### Aliases: BSL
### Keywords: spatial

### ** Examples

	data(nov3)
	data(nov4)
	nov.bsl <- BSL(nov3, nov4)
	plot(as.vector(as.matrix(nov3)), as.vector(as.matrix(nov4)))
	abline(nov.bsl$BSL, col="red")
	points(nov.bsl$top[1], nov.bsl$top[2], col="green", cex=2, pch=16)



