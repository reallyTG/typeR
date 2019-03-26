library(HistData)


### Name: Galton
### Title: Galton's data on the heights of parents and their children
### Aliases: Galton
### Keywords: datasets

### ** Examples

## Don't show: 
	# allow to work with car 1
	if (packageDescription("car")[["Version"]] < 2) {
		dataEllipse <- data.ellipse
	}
## End(Don't show)
data(Galton)

###########################################################################
# sunflower plot with regression line and data ellipses and lowess smooth
###########################################################################

with(Galton, 
	{
	sunflowerplot(parent,child, xlim=c(62,74), ylim=c(62,74))
	reg <- lm(child ~ parent)
	abline(reg)
	lines(lowess(parent, child), col="blue", lwd=2)
	if(require(car)) {
	dataEllipse(parent,child, xlim=c(62,74), ylim=c(62,74), plot.points=FALSE)
		}
  })




