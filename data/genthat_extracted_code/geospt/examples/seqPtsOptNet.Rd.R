library(geospt)


### Name: seqPtsOptNet
### Title: Design of optimal sampling networks through the sequential
###   points method
### Aliases: seqPtsOptNet
### Keywords: spatial

### ** Examples

## Not run: 
##D ## Load data
##D data(COSha10)
##D data(COSha10map)
##D data(lalib)
##D 
##D ## Calculate the sample variogram for data, generate the variogram model and  
##D ## fit ranges and/or sills from the variogram model to the sample variogram
##D ve <- variogram(CorT~ 1, loc=~x+y, data=COSha10, width = 230.3647)
##D PSI <- 0.0005346756; RAN <- 1012.6411; NUG <- 0.0005137079
##D m.esf <- vgm(PSI, "Sph", RAN, NUG)
##D (m.f.esf <- fit.variogram(ve, m.esf))
##D 
##D ## Optimize the location of the first additional point 
##D ## Only 15 generations are evaluated in this example (using ordinary kriging)
##D ## Users can visualize how the location of the additional point is optimized 
##D ## if plotMap is set to TRUE
##D old.par <- par(no.readonly = TRUE)
##D par(ask=FALSE)
##D optpt <- seqPtsOptNet(CorT~ 1, loc=~x+y, COSha10, m.f.esf, popSize=30, 
##D     generations=15, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], xmax=bbox(lalib)[3], 
##D     ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
##D par(old.par)
##D 
##D ## Summary of the genetic algorithm results
##D summary(optpt, echo=TRUE)
##D 
##D ## Graph of best and mean evaluation value of the objective function 
##D ## (average standard error) along generations
##D plot(optpt)
##D 
##D ## Find and plot the best set of additional points (best chromosome) in   
##D ## the population in the last generation
##D (bnet1 <- bestnet(optpt))
##D l1 = list("sp.polygons", lalib)
##D l2 = list("sp.points", bnet1, col="green", pch="*", cex=5)
##D spplot(COSha10map, "var1.pred", main="Location of the optimized point", 
##D     col.regions=bpy.colors(100), scales = list(draw =TRUE), xlab ="East (m)", 
##D     ylab = "North (m)", sp.layout=list(l1,l2))
##D 
##D ## Average standard error of the optimized sequential point
##D min(optpt$evaluations)
##D 
##D ## Optimize the location of the second sequential point, taking into account 
##D ## the first one
##D plot(lalib)
##D old.par <- par(no.readonly = TRUE)
##D par(ask=FALSE)
##D optpt2 <- seqPtsOptNet(CorT~ 1, loc=~x+y, COSha10, m.f.esf, prevSeqs=bnet1, 
##D     popSize=30, generations=15, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], 
##D     xmax=bbox(lalib)[3], ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
##D par(old.par)
##D 
##D ## Find the second optimal sequential point and use it, along with the first
##D ## one, to find another optimal sequential point, and so on iteratively  
##D 
##D bnet2 <- bestnet(optpt2)
##D bnet <- rbind(bnet1, bnet2)
##D 
##D old.par <- par(no.readonly = TRUE)
##D par(ask=FALSE)
##D optpt3 <- seqPtsOptNet(CorT~ 1, loc=~x+y, COSha10, m.f.esf, prevSeqs=bnet,
##D     popSize=30, generations=25, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], 
##D     xmax=bbox(lalib)[3], ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
##D par(old.par)
## End(Not run)

## Multivariate prediction is also enabled:
## Not run: 
##D ve <- variogram(CorT~ DA10, loc=~x+y, data=COSha10, width = 230.3647)
##D (m.f.esf <- fit.variogram(ve, m.esf))
##D 
##D optptMP <- seqPtsOptNet(CorT~ DA10, loc=~x+y, COSha10, m.f.esf, popSize=30, 
##D     generations=25, xmin=bbox(lalib)[1], ymin=bbox(lalib)[2], xmax=bbox(lalib)[3], 
##D     ymax=bbox(lalib)[4], plotMap=TRUE, spMap=lalib)
## End(Not run)



