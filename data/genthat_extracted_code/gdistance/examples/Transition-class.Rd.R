library(gdistance)


### Name: Transition* classes
### Title: Transition* classes
### Aliases: TransitionLayer-class TransitionStack-class
###   TransitionData-class Transition-class
###   coerce,TransitionLayer,sparseMatrix-method
###   coerce,TransitionLayer,RasterLayer-method
###   coerce,TransitionLayer,TransitionStack-method
###   coerce,TransitionLayer,TransitionData-method
###   coerce,RasterLayer,TransitionLayer-method
###   coerce,TransitionData,sparseMatrix-method show,TransitionLayer-method
###   show,TransitionStack-method ==,TransitionLayer,TransitionLayer-method
###   ==,TransitionStack,TransitionStack-method
### Keywords: classes

### ** Examples

showClass("TransitionLayer")

tr <- new("TransitionLayer", nrows=as.integer(36), ncols=as.integer(18),
		extent=extent(c(xmin=-180,xmax=180, ymin=-90,ymax=90)),
		crs=CRS("+proj=longlat +datum=WGS84"))

tr <- new("TransitionLayer",nrows=as.integer(36),ncols=as.integer(18),
        extent=extent(c(xmin=-180, xmax=180, ymin=-90,ymax=90)),
		crs=CRS(""))



