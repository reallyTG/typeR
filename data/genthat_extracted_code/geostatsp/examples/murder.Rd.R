library(geostatsp)


### Name: murder
### Title: Murder locations
### Aliases: murder torontoPdens torontoIncome torontoNight torontoBorder
### Keywords: datasets

### ** Examples

data("murder")
plot(torontoBorder)
points(murder, col="#0000FF40", cex=0.5)

data("torontoPop")

# light
data("murder")
plot(torontoNight, main="Toronto ambient light")
plot(torontoBorder, add=TRUE)
points(murder, col="#0000FF40", cex=0.5)


# income
plot(torontoIncome, main="Toronto Income")
points(murder, col="#0000FF40", cex=0.5)
plot(torontoBorder, add=TRUE)

# population density
plot(torontoPdens, main="Toronto pop dens")
points(murder, col="#0000FF40", cex=0.5)
plot(torontoBorder, add=TRUE)


## Not run: 
##D #building the dataset
##D fpath <- system.file("extdata", "murder1990.csv", package="geostatsp")
##D murderList=list()
##D # Load in datafiles retrieved from 
##D # http://www.thestar.com/news/crime/torontohomicidemap.html 
##D # Each year's murders are in a separate file, with 
##D # 1997, for example, being '/inst/extdata/murder1997.csv'
##D # this file was obtained by selecting the year '1997' from the
##D # menu marked 'select year', then clicking 'Download' at the bottom right
##D # selecting 'data' and in the new window clicking 'Underlying',
##D # then 'show all columnns' and 'dowload all rows as text file' 
##D for(Dyear in 1990:2014){
##D 	Dfile = gsub("1990", Dyear, fpath)
##D 	murderList[[as.character(Dyear)]] = read.table(Dfile, sep=",", header=TRUE,
##D 		comment.char="", as.is=TRUE, quote="\"")
##D }
##D murderFull = do.call(rbind, murderList)
##D 
##D murder = murderFull[,c(
##D 	"age.of.victim","sex.of.victim",
##D 	"Homicide.type.groupings","method",
##D 	 "URL","Details..if.available.")]
##D names(murder) = tolower(gsub("\..+$", "", names(murder)))
##D names(murder) = gsub("^homicide$", "type", names(murder))
##D murder$method = gsub(",", "", murder$method)
##D murder$sex = factor(murder$sex)
##D murder$type = factor(murder$type)
##D murder$date = as.Date(
##D 	as.character(murderFull$Date), 
##D 	format="##D 
##D murder$year = as.integer(format(murder$date, format="##D 
##D murder$date = as.Date(murder$date)
##D 
##D mcoord = as.matrix(
##D 	murderFull[,c("Addresses._longitude",
##D 		"Addresses._latitude")]
##D 	)
##D 	
##D murder=SpatialPointsDataFrame(
##D 	coords=mcoord,
##D 	data=murder, 
##D 	proj4string=CRS("+init=epsg:4326")
##D 	)
##D 	
##D # get rid of children to keep this from being too morbid
##D murder = murder[which(murder$age >= 18),]
##D 
##D utm = CRS("+proj=utm +zone=17 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0")
##D murder = spTransform(murder, utm)
##D 
##D # boundary of toronto
##D zipfileB = paste(tempfile(), ".zip", sep="")
##D download.file(
##D 	paste('http://www12.statcan.gc.ca/census-recensement/2011/geo/',
##D 	'bound-limit/files-fichiers/gcd_000b06a_e.zip',sep=''),
##D 	zipfileB)
##D unzip(zipfileB, exdir=tempdir())
##D theshpB = grep("shp$",unzip(zipfileB,list=TRUE)$Name,  value=TRUE)
##D theshpB = gsub("\.shp$", "", theshpB)
##D torontoBorder = rgdal::readOGR(tempdir(),theshpB,
##D 	stringsAsFactors=FALSE)
##D torontoBorder = torontoBorder[
##D 	grep("toronto", 
##D 	as.character(torontoBorder$CDNAME), 
##D 	ignore.case=TRUE),
##D ]
##D 
##D  
##D torontoBorder =	spTransform(
##D 	torontoBorder, CRS(proj4string(murder))
##D 	)
##D library('mapmisc')
##D toMap = openmap(torontoBorder)
##D map.new(torontoBorder)
##D plot(toMap,add=TRUE)
##D plot(torontoBorder,add=TRUE)
##D points(murder,col='green')
##D 
##D 
##D save(murder, torontoBorder, 
##D 	file="~/workspace/diseasemapping/pkg/geostatsp/data/murder.RData",
##D 	compress='xz')
##D 
##D # census tract boundaries
##D zipfileCT = file.path(tempdir(),'toCt.zip')
##D download.file(
##D 	paste('http://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/',
##D 	'files-fichiers/gct_000b06a_e.zip', sep=''),
##D 		zipfileCT
##D 		) 
##D 		
##D unzip(zipfileCT, exdir=tempdir())
##D theshpCT = grep("shp$",unzip(zipfileCT,list=TRUE)$Name,  value=TRUE)
##D theshpCT = gsub("\.shp$", "", theshpCT)
##D 
##D toCt2006 = readOGR(tempdir(),theshpCT)
##D toCt2006 = spTransform(toCt2006, CRS(proj4string(torontoBorder)))
##D aspoints = SpatialPoints(toCt2006)
##D projection(aspoints) = CRS(proj4string(torontoBorder))
##D inToronto = over(aspoints, torontoBorder)$CDNAME
##D toCt2006 =toCt2006[!is.na(inToronto),]
##D toCt2006 = spTransform(toCt2006, 
##D 	CRS(proj4string(murder)))
##D 
##D 
##D # income
##D zipfileI = paste(tempfile(), ".zip", sep="")
##D download.file(
##D paste('http://www12.statcan.gc.ca/census-recensement/2006/dp-pd/tbt/',
##D 'OpenDataDownload.cfm?PID=96273', sep=""),
##D zipfileI)
##D 
##D 	unzip(zipfileI, exdir=tempdir())
##D 	thesdmx = grep("^Generic",unzip(zipfileI,list=TRUE)$Name,  value=TRUE)
##D 	library('rsdmx')
##D 	toIncSdmx = readSDMX(file.path(tempdir(), thesdmx), isURL=FALSE)
##D 	toInc = as.data.frame(toIncSdmx)
##D 	toIncSub = toInc[grep("^535", toInc$GEO),]
##D 	toIncSub = toIncSub[toIncSub$DIM0==3 & toIncSub$DIM1==1,]
##D 	rownames(toIncSub) = toIncSub$GEO
##D toCt2006$income_median_household = toIncSub[
##D 		gsub("\.", "", as.character(toCt2006$CTUID)),
##D 		'obsValue']
##D 
##D torontoIncome = rasterize(toCt2006, 
##D 	squareRaster(torontoBorder, 150),
##D 	field='income_median_household')
##D 
##D 
##D 
##D nightFile = paste(tempfile(), ".tif.gz", sep="")
##D 
##D # higher resolution at 
##D paste('http://mapserver.ngdc.noaa.gov/viirs_data/viirs_composite/'
##D 'npp_20120418to20120426_20121011to20121023_sloff_15asec.'
##D 'x2y1.75N180W.c20121120.avg_dnb.tif.gz',sep='')
##D download.file(
##D 'http://www.worldgrids.org/lib/exe/fetch.php?media=lnmdms3a.tif.gz',
##D nightFile)
##D library("R.utils")
##D gunzip(nightFile,overwrite=TRUE)
##D nightFull = raster(gsub("\.gz$", "", nightFile))
##D 
##D border2 = spTransform(torontoBorder, CRS(projection(nightFull)))
##D toMap2 = openmap(border2)
##D 
##D torontoNight = crop(nightFull, raster::extend(extent(border2),0.1))
##D torontoNight = projectRaster(torontoNight, crs=CRS(proj4string(murder)))
##D cscaleNight = colourScale(torontoNight,breaks=9,style='equal',dec=0)
##D 
##D map.new(torontoBorder)
##D plot(toMap,add=TRUE)
##D plot(torontoNight,add=TRUE, 
##D 	col=cscaleNight$col,
##D 	breaks=cscaleNight$breaks, 
##D 	legend=FALSE,
##D 	alpha=0.5)
##D plot(torontoBorder,add=TRUE)
##D legendBreaks('bottomright', cscaleNight)
##D 
##D save(torontoIncome, torontoNight, 
##D 	torontoPdens,
##D 	file="../pkg/geostatsp/data/torontoPop.RData",
##D 	compress='xz')
##D 
## End(Not run) # end don't run




