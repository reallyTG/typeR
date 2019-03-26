library(geospt)


### Name: simPtsOptNet
### Title: Design of optimal sampling networks through the simultaneous
###   points method
### Aliases: simPtsOptNet
### Keywords: spatial

### ** Examples

## Not run: 
##D ## Load data
##D data(COSha30)
##D data(COSha30map)
##D data(lalib)
##D 
##D ## Calculate the sample variogram for data, generate the variogram model and  
##D ## fit ranges and/or sills from the variogram model to the sample variogram
##D ve <- variogram(CorT~ 1, loc=~x+y, data=COSha30, width = 236.0536)
##D PSI <- 0.0001531892; RAN <- 1031.8884; NUG <- 0.0001471817
##D m.esf <- vgm(PSI, "Sph", RAN, NUG)
##D (m.f.esf <- fit.variogram(ve, m.esf))
##D 
##D ## Number of additional points to be added to the network
##D npoints <- 5
##D 
##D ## Optimize the location of the additional points
##D ## Only 20 generations are evaluated in this example (using ordinary kriging)
##D ## Users can visualize how the location of the additional points is optimized 
##D ## if plotMap is set to TRUE
##D old.par <- par(no.readonly = TRUE)
##D par(ask=FALSE)
##D optnets <- simPtsOptNet(CorT~ 1, loc=~x+y, COSha30, m.f.esf, n=npoints, 
##D     popSize=30, generations=20, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], 
##D     xmax=bbox(lalib)[3], ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
##D par(old.par)
##D 
##D ## Summary of the genetic algorithm results
##D summary(optnets, echo=TRUE)
##D 
##D ## Graph of best and mean evaluation value of the objective function 
##D ## (average standard error) along generations
##D plot(optnets)
##D 
##D ## Find and plot the best set of additional points (best chromosome) in   
##D ## the population in the last generation
##D (bnet <- bestnet(optnets))
##D l1 = list("sp.polygons", lalib)
##D l2 = list("sp.points", bnet, col="green", pch="*", cex=5)
##D spplot(COSha30map, "var1.pred", main="Location of the optimized points", 
##D     col.regions=bpy.colors(100), scales = list(draw =TRUE), xlab ="East (m)", 
##D     ylab = "North (m)", sp.layout=list(l1,l2))
##D 
##D ## Average standard error of the optimized additional points
##D min(optnets$evaluations)
## End(Not run)

## Multivariate prediction is also enabled:
## Not run: 
##D ve <- variogram(CorT~ DA30, loc=~x+y, data=COSha30, width = 236.0536)
##D (m.f.esf <- fit.variogram(ve, m.esf))
##D 
##D optnetsMP <- simPtsOptNet(CorT~ DA30, loc=~x+y, COSha30, m.f.esf, n=npoints, 
##D     popSize=30, generations=25, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], 
##D     xmax=bbox(lalib)[3], ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
## End(Not run)



