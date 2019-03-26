library(gpclib)


### Name: new-generics
### Title: Generics/Methods for polygon objects
### Aliases: new-generics append.poly append.poly-methods get.bbox
###   get.bbox-methods area.poly area.poly-methods get.pts get.pts-methods
###   scale.poly scale.poly-methods tristrip tristrip-methods triangulate
###   triangulate-methods
### Keywords: methods

### ** Examples

holepoly <- read.polyfile(system.file("poly-ex/hole-poly.txt", package =
"gpclib"), nohole = FALSE)
area.poly(holepoly)
stopifnot(area.poly(holepoly) == 8)



