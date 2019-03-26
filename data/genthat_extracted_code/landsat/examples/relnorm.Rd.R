library(landsat)


### Name: relnorm
### Title: Relative normalization of an image
### Aliases: relnorm
### Keywords: stats image

### ** Examples

## Not run: 
##D 	data(nov3)
##D 	data(july3)
##D 	par(mfrow=c(2,2))
##D 	image(nov3)
##D 	image(july3)
##D 
##D 	nov3.newR <- relnorm(master=july3, tofix=nov3)
##D 	image(nov3.newR$newimage)
##D 
##D 	nov3.newH <- histmatch(master=july3, tofix=nov3)
##D 	image(nov3.newH$newimage)
## End(Not run)



