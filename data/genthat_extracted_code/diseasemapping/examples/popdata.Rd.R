library(diseasemapping)


### Name: popdata
### Title: Ontario 2006 population by census subdivision
### Aliases: popdata
### Keywords: datasets

### ** Examples

data(popdata)
head(popdata@data)
## Not run: 
##D library(sp)
##D spplot(popdata, zcol='F.50_54', breaks=9, col=rainbow(8))
## End(Not run)
## Not run: 
##D 
##D library('raster')
##D library('sp')
##D bfile = tempfile(fileext='.zip')
##D download.file(
##D paste('http://www12.statcan.gc.ca/census-recensement/',
##D '2011/geo/bound-limit/files-fichiers/gcsd000a06a_e.zip',
##D sep=''),
##D bfile)
##D unzip(bfile, exdir=tempdir())
##D sfile = grep('shp$',unzip(bfile, list=TRUE)$Name, value=TRUE)
##D popdata = shapefile(file.path(tempdir(),sfile))
##D popdata$PRNAME = iconv(popdata$PRNAME, 'UTF-8', 'latin1')
##D popdata = popdata[grep("^Ont", popdata$PRNAME),]
##D popdataS= rgeos::gSimplify(popdata, 0.01, topologyPreserve=TRUE)
##D popdata = SpatialPolygonsDataFrame(popdataS, popdata@data)
##D projection(popdata) = CRS('+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0')
##D 
##D pfile = tempfile(fileext='zip')
##D 
##D download.file(
##D paste('https://www12.statcan.gc.ca/census-recensement/',
##D '2011/dp-pd/prof/details/download-telecharger/comprehensive/',
##D 'comp_download.cfm?CTLG=92-591-XE&FMT=CSV301&Lang=E&Tab=1&',
##D 'Geo1=PR&Code1=01&Geo2=PR&Code2=01&Data=Count&SearchText=&',
##D 'SearchType=Begins&SearchPR=01&B1=All&Custom=&TABID=1', sep=''),
##D pfile, method='curl')
##D unzip(pfile, exdir=tempdir())
##D ofile = grep('ONT', unzip(pfile, list=TRUE)$Name,value=TRUE)
##D opop = read.table(file.path(tempdir(),ofile),header=F,skip=3, 
##D sep=',', nrows=163210,stringsAsFactors=FALSE)
##D opop= opop[grep("^([[:digit:]]|to| )+ years( and over)?$", opop[,7]),]
##D opop = opop[,c(1,4,7,11,13)]
##D colnames(opop) = c('id','name','var','M','F')
##D opop[,'var'] = gsub(" to ", "_", opop[,'var'])
##D opop[,'var'] = gsub(" years( and over)?", "", opop[,'var'])
##D opop[,'var'] = gsub("[[:space:]]", "", opop[,'var'])
##D opop2 = reshape(opop, direction='wide', 
##D idvar=c('id','name'),
##D timevar='var', v.names=c('M','F'))
##D 
##D 
##D popdata = sp::merge(popdata, opop2, by.x='CSDUID', by.y='id')
##D popdata=popdata[,c('CSDUID', grep("^(M|F)", names(popdata), value=TRUE))]
##D 
##D 
##D 
##D save(popdata, file=
##D '/home/patrick/workspace/diseasemapping/pkg/diseasemapping/data/popdata.RData',
##D compress='xz')
## End(Not run)



