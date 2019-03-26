library(BurStFin)


### Name: partial.rainbow
### Title: Create Palette Function for Part of Rainbow
### Aliases: partial.rainbow
### Keywords: color

### ** Examples

ap1 <- alpha.proxy(cor.man=seq(0, .3, len=50), 
	vol.man=seq(.15, .25, leng=60), plot=FALSE)
filled.contour(ap1, color.palette=partial.rainbow(start=.05, end=.3))



