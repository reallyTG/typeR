library(geostatsp)


### Name: swissRain
### Title: Swiss rainfall data
### Aliases: swissRain swissAltitude swissBorder swissLandType
### Keywords: datasets

### ** Examples

data("swissRain")
plot(swissAltitude, main="elevation")
points(swissRain)
plot(swissBorder, add=TRUE)


# land type, a categorical variable
commonValues  = sort(table(values(swissLandType)),decreasing=TRUE)[1:5]
commonValues=commonValues[!names(commonValues)==0]

thelevels = levels(swissLandType)[[1]]$ID
thebreaks = c(-0.5, 0.5+thelevels)
thecol = rep(NA, length(thelevels))
names(thecol) = as.character(thelevels)

thecol[names(commonValues)] = rainbow(length(commonValues))

plot(swissLandType, breaks=thebreaks, col=thecol,legend=FALSE,
	main="land type")
points(swissRain)
plot(swissBorder, add=TRUE)


legend("topleft",fill=thecol[names(commonValues)],
		legend=levels(swissLandType)[[1]][
						match(as.integer(names(commonValues)),
								levels(swissLandType)[[1]]$ID),
						"Category"],
				bty='n'
				)

# code to assemble the dataset
## Not run: 
##D dataDir = "/store/patirck/spatialData/"
##D download.file("http://mldata.org/repository/data/download/spat-interp-comparison-1997/",
##D 	destfile=paste(dataDir, "swiss.zip",sep=""))
##D unzip(paste(dataDir, 'swiss.zip',sep=""), exdir=dataDir)
##D swissRain = read.table(paste(dataDir, "sic_obs.dat",sep=""),sep=',', 
##D 	col.names=c('ID','x','y','rain'))
##D # the following seems to make the coordinates line up with epsg:2056
##D swissRain$x = swissRain$x - 17791.29 + 2672591 
##D swissRain$y = swissRain$y - 13224.66 + 1200225
##D # the readme file says rain is in tenths of mm 
##D swissRain$rain= swissRain$rain / 10  
##D library(sp)
##D library(rgdal)
##D # create projection without epsg code so rgdal doesn't need to be loaded
##D theproj = CRSargs(CRS("+init=epsg:2056"))
##D theproj = gsub("\+init=epsg:[[:digit:]]+ ", "", theproj)
##D theproj = CRS(theproj)
##D 
##D swissRain = SpatialPointsDataFrame(swissRain[,c('x','y')], data=swissRain[,c('ID','rain')], 
##D 	proj4string=theproj)
##D 
##D 
##D 
##D #######
##D # Swiss Border
##D #######
##D 
##D 
##D library('raster')
##D swissBorder = getData('GADM', country='CHE', level=0)
##D isChar = which(unlist(lapply(swissBorder@data, is.character)))
##D isUtf = which(
##D 	unlist(lapply(swissBorder@data[,isChar], 
##D 		Encoding)) == 'UTF-8')
##D swissBorder = swissBorder[,
##D 	!match(names(swissBorder), names(isUtf), nomatch=0)
##D 	]
##D library(rgdal)
##D swissBorder = spTransform(swissBorder, CRS(proj4string(swissRain)))
##D 
##D ############
##D # land type
##D ############
##D # see loaloa's help file for installation of the MODIS package
##D library(MODIS)
##D MODISoptions(gdalPath="/usr/bin/", 
##D 	localArcPath=dataDir, outDirPath=dataDir)
##D options()[grep("MODIS", names(options()), value=TRUE)]
##D 
##D myProduct = "MCD12Q1"
##D getProduct(myProduct)
##D 
##D thehdf=getHdf(product=myProduct,
##D 		begin="2002-01-01",end="2002-01-02",
##D 		extent=extent(spTransform(swissBorder, CRS("+init=epsg:4326"))))
##D 
##D layerNames = getSds(thehdf[[1]][1])$SDSnames
##D ltLayer = grep("Type_1$", layerNames)
##D theString = rep(0, length(layerNames))
##D theString[ltLayer] = 1
##D theString = paste(theString, collapse="")
##D 
##D runGdal(product=myProduct,
##D 		begin="2002-01-01",end="2002-01-02",
##D 		outProj = proj4string(swissRain),
##D 		pixelSize=2000, job="loa",
##D 		SDSstring = theString,
##D 		extent=extent(spTransform(swissBorder, CRS("+init=epsg:4326"))))
##D 
##D # find file name 
##D thenames = preStack(
##D 		path = paste(options()$MODIS_outDirPath, "loa",sep=""),
##D 		pattern=myProduct)
##D swissLandType = raster(thenames)
##D swissLandType = crop(swissLandType, extend(extent(swissBorder),20000))
##D 
##D 
##D swissLandType = as.factor(swissLandType)
##D 
##D # labels of land types
##D library(XML)
##D labels = readHTMLTable("http://nsidc.org/data/ease/ancillary.html")
##D labels = labels[[grep("Land Cover Classes", names(labels))]]
##D classCol = grep("Class Number", names(labels))
##D labels[,classCol] = as.integer(as.character(labels[,classCol]))
##D 
##D labels[  grep("Water", labels$Category), 
##D 		classCol		
##D ] = 0
##D labelVec = as.character(labels$Category)
##D names(labelVec) = as.character(labels[,classCol])
##D 
##D 
##D levels(swissLandType)[[1]]$Category = 
##D 		labelVec[as.character(levels(swissLandType)[[1]]$ID)]
##D 
##D levels(swissLandType)[[1]]$col = NA
##D 
##D theForests = grep("forest", levels(swissLandType)[[1]]$Category, 
##D 	ignore.case=TRUE)
##D 	
##D library(RColorBrewer)	
##D levels(swissLandType)[[1]][theForests,"col"] = 
##D 	brewer.pal(length(theForests)+1, "Greens")[-1]
##D 	
##D levels(swissLandType)[[1]][
##D 	grep("snow", levels(swissLandType)[[1]]$Category,ignore.case=TRUE),
##D 	"col"] = "#FFFFFF"
##D 
##D levels(swissLandType)[[1]][
##D 	grep("water", levels(swissLandType)[[1]]$Category,ignore.case=TRUE),
##D 	"col"] = "#0000FF"
##D 
##D levels(swissLandType)[[1]][
##D 	grep("grass", levels(swissLandType)[[1]]$Category,ignore.case=TRUE),
##D 	"col"] = "#CCBB00"
##D 
##D 	
##D stillNA = is.na(levels(swissLandType)[[1]]$col)
##D levels(swissLandType)[[1]][stillNA, "col"] =
##D 	brewer.pal(sum(stillNA), "Set3")
##D 	
##D 	
##D 
##D swissLandType@legend@colortable = levels(swissLandType)[[1]]$col
##D 
##D levels(swissLandType)[[1]]$n = table(values(swissLandType))
##D 
##D plot(swissLandType)
##D mostCommon = levels(swissLandType)[[1]]$n >= 700
##D legend("topright", 	
##D 	fill=levels(swissLandType)[[1]][mostCommon,"col"],
##D 	legend = substr(
##D 		levels(swissLandType)[[1]][mostCommon,"Category"],
##D 		1, 12)
##D 	)
##D 	
##D table(extract(swissLandType, swissRain), exclude=NULL)
##D 
##D 
##D #### 
##D # SwissAltitude
##D ###
##D library(raster)
##D download.file('http://biogeo.ucdavis.edu/data/diva/alt/CHE_alt.zip',
##D 	destfile=paste(dataDir,'CHE_alt.zip',sep=""))
##D unzip(paste(dataDir, 'CHE_alt.zip',sep=""), exdir=dataDir)
##D swissAltitude = raster(paste(dataDir, "CHE_alt.gri",sep=""))
##D swissAltitude = projectRaster(swissAltitude, 
##D 	crs=CRS(proj4string(swissRain)))
##D swissAltitude = aggregate(swissAltitude,fact=2)
##D  
##D  
##D save(swissRain, swissAltitude, swissBorder, swissLandType,
##D 		file="~/workspace/diseasemapping/pkg/geostatsp/data/swissRain.RData",
##D 		compress="xz")
## End(Not run)




