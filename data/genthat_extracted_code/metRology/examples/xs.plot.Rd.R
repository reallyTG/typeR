library(metRology)


### Name: xs.plot
### Title: Mean/Standard deviation plot with confidence region.
### Aliases: xs.plot xs.plot.default XSplot
### Keywords: hplot

### ** Examples

	require(metRology)
	set.seed(1017)
	x <- rnorm(80)
	g <- gl(20,4)
	
	xs.plot(x,g)

	#Identical plot with precalculated s:
	X <- tapply(x,g,mean)
	S <- tapply(x,g,sd)
	xs.plot(X, s=S, degfree=3)

	#Specify different location and within-group SD estimates:
	xs.plot(X, s=S, degfree=3, mu=median(X), sigma=median(S))
	
	#Illustrate multiple contour labelling, point labels and further embellishment
	rv <- xs.plot(x,g, pos.clab=c("bottomleft", "bottomright"), labels=TRUE)
	abline(v=rv$mu, h=rv$s, col=2)
	
	



