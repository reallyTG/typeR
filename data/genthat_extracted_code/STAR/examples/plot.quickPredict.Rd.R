library(STAR)


### Name: plot.quickPredict
### Title: Graphical Methods for quickPredict Objects
### Aliases: plot.quickPredict lines.quickPredict image.quickPredict
###   contour.quickPredict persp.quickPredict
### Keywords: hplot methods models smooth

### ** Examples

## Not run: 
##D ## Follow up of ssanova example of gss
##D data(nox)
##D nox.fit <- ssanova(log10(nox)~comp*equi,data=nox)
##D ## get prediction for the first term, comp
##D comp.pred <- quickPredict(nox.fit)
##D ## plot result with method plot for quickPredict objects
##D plot(comp.pred)
##D ## get prediction for the second term, equi using the binary version
##D equi.pred <- nox.fit ##D 
##D plot(equi.pred)
##D ## get prediction for the interaction term, comp:equi
##D comp.equi.pred <- nox.fit ##D 
##D ## use image method image
##D image(comp.equi.pred)
##D ## use contour method
##D contour(comp.equi.pred,col=2,lwd=2,labcex=1.5)
##D contour(comp.equi.pred,what="sd",lty=3,labcex=1.2,add=TRUE)
##D ## use persp method
##D persp(comp.equi.pred,theta=-10,phi=20)
## End(Not run)



