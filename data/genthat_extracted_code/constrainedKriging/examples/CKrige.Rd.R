library(constrainedKriging)


### Name: CKrige
### Title: Spatial interpolation (2D) by constrained, covariance-matching
###   constrained and universal, global Point or Block Kriging
### Aliases: CKrige CKrige.points CKrige.polygons CKrige-methods
###   CKrige,formula,data.frame,formula,preCKrigePoints-method
###   CKrige,formula,data.frame,formula,preCKrigePolygons-method
###   print.CKrige.exout.polygons summary.CKrige.exout.polygons
###   print.CKrige.exout.points summary.CKrige.exout.points
### Keywords: methods

### ** Examples

## Not run: 
##D # load data
##D data(meuse,meuse.blocks)
##D 
##D # approximation of block variance
##D # pixel area = 75m x 75m
##D # exponential covariance function with measurement error = 0, nugget = 0.05,
##D # part. sill =  0.15 and range parameter = 192.5
##D 
##D 
##D preCK=preCKrige(newdata=meuse.blocks,model=
##D     covmodel("exponential",0,0.05,0.15,192.5),pwidth=75,pheight=75)
##D 
##D # block prediction by constrained kriging on the log scale
##D 
##D CK=CKrige(formula=log(zinc)~sqrt(dist),data=meuse,
##D locations=~x+y,object=preCK,ex.out=TRUE)
##D 
##D # backtransformation to the original scale for the CK prediction
##D 
##D beta=CK$parameter$beta.coef
##D M=meuse.blocks@data$M
##D c1 <-  0.2
##D c2  <- beta[2]^2 * meuse.blocks@data$M
##D CK$object@data$Zn=exp(CK$object@data$prediction
##D + 0.5*(0.2+beta[2]^2*M-unlist(preCK@covmat)))
##D 
##D # U: upper limits of the relative 95 ##D 
##D # U multiplied by the predictions CK$object@data$Zn gives
##D # the upper limits of the 95 ##D 
##D 
##D CK$object@data$U=exp(CK$object@data$prediction
##D     +1.96*CK$object@data$prediction.se) /CK$object@data$Zn
##D 
##D # plots with spplot, generic function in the sp package
##D # the plot shows the constrained kriging predictions on
##D # the orginal scale
##D # function ck.colors(n) create a rainbow-like  color vector
##D 
##D breaks <- seq(0, 1850, by = 185)
##D spplot(CK$object,zcol="Zn",at=breaks,col.regions=ck.colors(10),
##D colorkey=list(labels=list(at=breaks,labels=breaks)))
##D 
##D # plot of the factor to get the upper bound of the
##D 97.5##D 
##D 
##D breaks=seq(1,3.2,by=0.2)
##D spplot(CK$object,zcol="U",at=breaks,col.regions=ck.colors(11),
##D colorkey=list(labels=list(at=breaks,labels=breaks)))
## End(Not run)



