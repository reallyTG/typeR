library(RSA)


### Name: movieRSA
### Title: Create a movie of plotRSA plots, with changing surface and/or
###   rotation
### Aliases: movieRSA

### ** Examples

## Not run: 
##D movieRSA(name="SD0",
##D 		frames <- list(
##D 	 	step1 = list(b0=0, xy=-.40, x2=.20, y2=.20, 
##D 			rotation=list(x=-63, y=32, z=15),
##D 			legend=FALSE, zlim=c(0, 4), param=FALSE),
##D 	 	step2 = list(b0=0, xy=-.10, x2=.05, y2=.05, 
##D 			rotation=list(x=-54, y=39, z=25)),
##D 		step3 = list(b0=0, xy=-.40, x2=.20, y2=.20, 
##D 			rotation=list(x=-45, y=45, z=35))
##D 	 ),
##D 	 mirror=TRUE, fps=30, dur=5000)
## End(Not run)



