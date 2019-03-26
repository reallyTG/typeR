library(inlmisc)


### Name: AddInsetMap
### Title: Add Inset Map to Plot
### Aliases: AddInsetMap
### Keywords: hplot

### ** Examples

file <- system.file("extdata/county.geojson", package = "inlmisc")[1]
county <- rgdal::readOGR(file)
ext <- c(-113.4005, -112.2764, 43.30, 44.11)
PlotMap(county, xlim = ext[1:2], ylim = ext[3:4], dms.tick = TRUE)
sp::plot(county, add = TRUE)
inlmisc::AddInsetMap(county, width = 2, main.label = list("IDAHO", adj = c(0, -10)),
                     sub.label=list("Map area", adj = c(0, -4)), loc = "topright")




