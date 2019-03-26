library(RPPanalyzer)


### Name: correctDilinterc
### Title: Dilution series intersect correction
### Aliases: correctDilinterc analyzeIntercepts getIntercepts getSignals
###   as.my

### ** Examples

## Not run: 
##D library(RPPanalyzer)
##D 
##D 
##D # read data
##D dataDir <- system.file("extdata", package="RPPanalyzer")
##D setwd(dataDir)
##D rawdata <- read.Data(blocksperarray=12, spotter="aushon", printFlags=FALSE)
##D # write data
##D write.Data(rawdata,FileNameExtension="test_data")
##D # import raw data
##D fgRaw.tmp <- read.delim("test_dataexpression.txt",
##D stringsAsFactors=FALSE, row.names=NULL, header=TRUE)
##D fgRaw <- read.delim("test_dataexpression.txt", skip=max(which(fgRaw.tmp[,1]==""))+1,
##D stringsAsFactors=FALSE, row.names=NULL, header=TRUE)
##D # remove NAs
##D fgNAVec <- which(is.na(fgRaw[,"ID"]))
##D if(length(fgNAVec) > 0){
##D fgRaw <- fgRaw[-fgNAVec,]
##D }
##D colnames(fgRaw) <- sub("X","", gsub("\\.","-", colnames(fgRaw)))
##D # correct data for BG noise
##D correctedData <- correctDilinterc(dilseries=fgRaw[which(fgRaw$sample_type=="control" &
##D !is.na(fgRaw$dilSeriesID)),], arraydesc=rawdata$arraydescription,
##D timeseries=fgRaw[which(fgRaw$sample_type=="measurement"),], exportNo=2)
## End(Not run)




