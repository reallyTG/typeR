library(beadarrayMSV)


### Name: readBeadSummaryOutput
### Title: Read bead-summary intensities from two colour Illumina
###   (Infinium) scanner
### Aliases: readBeadSummaryOutput

### ** Examples

## Not run: 
##D #Read a BeadSetIllumina object using files in example data directory
##D rPath <- system.file("extdata", package="beadarrayMSV")
##D BSDataRaw <- readBeadSummaryOutput(path=rPath,recursive=TRUE)
##D 
##D #Print information from object
##D BSDataRaw
##D pData(BSDataRaw)
##D varMetadata(BSDataRaw)
##D 
##D #Alternatively:
##D sampleFile <- paste(rPath,'sampleData.txt',sep='/')
##D sampleInfo <- read.table(sampleFile,skip=8,sep='\t',header=TRUE,
##D     colClasses='character')
##D rownames(sampleInfo) <- make.names(paste(sampleInfo$chip,
##D     sampleInfo$row,sep='_'))
##D pattern <- 'beadTypeFile.txt'
##D fullPaths <- paste(sampleInfo$chip,'/',sampleInfo$chip,'_',
##D     sampleInfo$row,'_',pattern,sep='')
##D BSDataRaw <- readBeadSummaryOutput(fullPaths=fullPaths[1:4],
##D     path=rPath,pattern=pattern)
##D 
##D ## Plot G vs. R
##D dev.new()
##D scatterArrays(BSDataRaw,smooth=FALSE)
## End(Not run)



