library(polyCub)


### Name: coerce-sp-methods
### Title: Coerce '"SpatialPolygons"' to '"owin"'
### Aliases: coerce-sp-methods as.owin.SpatialPolygons as.owin.Polygons
###   as.owin.Polygon coerce,SpatialPolygons,owin-method
###   coerce,Polygons,owin-method coerce,Polygon,owin-method
###   coerce,Polygon,Polygons-method
### Keywords: methods spatial

### ** Examples

if (require("spatstat") && require("sp")) {
    diamond <- list(x = c(1,2,1,0), y = c(1,2,3,2))  # anti-clockwise
    diamond.owin <- owin(poly = diamond)
    diamond.sp <- Polygon(lapply(diamond, rev))      # clockwise
    diamond.owin_from_sp <- as(diamond.sp, "owin")
    stopifnot(all.equal(diamond.owin, diamond.owin_from_sp))

    ## similarly works for Polygons and SpatialPolygons
    diamond.Ps <- as(diamond.sp, "Polygons")
    stopifnot(identical(diamond.owin, as.owin(diamond.Ps)))
    diamond.SpPs <- SpatialPolygons(list(diamond.Ps))
    stopifnot(identical(diamond.owin, as.owin(diamond.SpPs)))
}



