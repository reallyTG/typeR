library(maptools)


### Name: ContourLines2SLDF
### Title: Converter functions to build SpatialLinesDataFrame objects
### Aliases: ArcObj2SLDF ContourLines2SLDF MapGen2SL
### Keywords: spatial

### ** Examples

#data(co37_d90_arc) # retrieved as: 
# library(RArcInfo)
# fl <- "http://www.census.gov/geo/cob/bdy/co/co90e00/co37_d90_e00.zip"
# download.file(fl, "co37_d90_e00.zip")
# e00 <- zip.file.extract("co37_d90.e00", "co37_d90_e00.zip")
# e00toavc(e00, "ncar")
# arc <- get.arcdata(".", "ncar")
#res <- arcobj2SLDF(arc)
#plot(res)
#invisible(title(""))
res <- ContourLines2SLDF(contourLines(volcano))
plot(res, col=terrain.colors(nrow(as(res, "data.frame"))))
title("Volcano contours as SpatialLines")



