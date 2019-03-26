library(geostatsp)


### Name: gambiaUTM
### Title: Gambia data
### Aliases: gambiaUTM
### Keywords: datasets

### ** Examples

data("gambiaUTM")

plot(gambiaUTM, main="gambia data")

## Not run: 
##D # get the gambia data
##D 
##D gambia = read.table(
##D "http://www.leg.ufpr.br/lib/exe/fetch.php/pessoais:paulojus:mbgbook:datasets:gambia.txt",
##D header=TRUE)
##D 
##D # create projection without epsg code so rgdal doesn't need to be loaded
##D library(sp)
##D library(rgdal)
##D theproj = CRSargs(CRS("+init=epsg:32628"))
##D theproj = gsub("\+init=epsg:[[:digit:]]+ ", "", theproj)
##D theproj = CRS(theproj)
##D 
##D gambiaUTM = SpatialPointsDataFrame(gambia[,c("x","y")], 
##D 		data=gambia[,-(1:2)], 
##D 		proj4string = theproj)
##D save(gambiaUTM, 		
##D 	file="~/workspace/diseasemapping/pkg/geostatsp/data/gambiaUTM.RData", 
##D 	compress="xz")
##D 
##D 
##D 	download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip", 
##D   		"borders.zip")
##D 	unzip("borders.zip")
##D 	worldBorders = readOGR(".", "TM_WORLD_BORDERS-0.3")
##D 	africa = worldBorders[worldBorders$REGION ==2,]
##D 	plot(gambiaUTM)
##D 	plot(spTransform(africa, gambiaUTM@proj4string),add=TRUE)
## End(Not run)





