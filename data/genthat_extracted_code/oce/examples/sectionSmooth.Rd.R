library(oce)


### Name: sectionSmooth
### Title: Smooth a Section
### Aliases: sectionSmooth

### ** Examples

library(oce)
data(section)
gs <- subset(section, 109<=stationId&stationId<=129)
gsg <- sectionGrid(gs, p=seq(0, 5000, 150))
gss1 <- sectionSmooth(gsg, "spline", df=16)
plot(gss1)
## Not run: 
##D gss2 <- sectionSmooth(gsg, "barnes", xr=24, yr=100)
##D plot(gss2)
## End(Not run)




