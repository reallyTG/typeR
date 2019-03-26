library(polyCub)


### Name: coerce-gpc-methods
### Title: Conversion between polygonal '"owin"' and '"gpc.poly"'
### Aliases: coerce-gpc-methods owin2gpc gpc2owin as.owin.gpc.poly
### Keywords: methods spatial

### ** Examples

if (gpclibPermit() && require("spatstat")) {
    ## use example polygons from
    example(plotpolyf, ask = FALSE)

    letterR  # a simple "xylist"
    letterR.owin <- owin(poly = letterR)
    letterR.gpc_from_owin <- owin2gpc(letterR.owin)
    letterR.xylist_from_gpc <- xylist(letterR.gpc_from_owin)
    stopifnot(all.equal(letterR, lapply(letterR.xylist_from_gpc, "[", 1:2)))
    letterR.owin_from_gpc <- as.owin(letterR.gpc_from_owin)
    stopifnot(all.equal(letterR.owin, letterR.owin_from_gpc))
}



