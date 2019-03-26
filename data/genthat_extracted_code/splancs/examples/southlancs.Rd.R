library(splancs)


### Name: southlancs
### Title: Cancer cases in Chorley-Ribble
### Aliases: southlancs southlancs.pts southlancs.cc old.incinerator
###   southlancs.bdy
### Keywords: datasets

### ** Examples

data(southlancs)
op <- par(mfrow=c(2,1))
pointmap(southlancs.pts[southlancs.cc == 0,])
pointmap(old.incinerator, add=TRUE, col="red", pch=19)
title("Lung cancer controls")
pointmap(southlancs.pts[southlancs.cc == 1,])
pointmap(old.incinerator, add=TRUE, col="red", pch=19)
title("Larynx cancer cases")
par(op)
polymap(southlancs.bdy,border="grey")
contour(kernel2d(southlancs.pts[southlancs.cc == 0,], 
	southlancs.bdy, h=500, nx=100, ny=100), nlevels=20, 
	add=TRUE,drawlabels=FALSE)
pointmap(southlancs.pts[southlancs.cc == 1,], add=TRUE, pch=19,
	 col="green")
pointmap(old.incinerator, add=TRUE, pch=19, col="red")
title(xlab="h=500, quartic kernel")
title("Density map of control, green case points, red old incinerator")




