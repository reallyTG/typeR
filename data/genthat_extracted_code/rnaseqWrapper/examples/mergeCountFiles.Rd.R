library(rnaseqWrapper)


### Name: mergeCountFiles
### Title: Merge multiple expression count data files for RNAseq
### Aliases: mergeCountFiles

### ** Examples

  
## Find where the data is stored (or use your own)
pathToData <- try(system.file("",package="rnaseqWrapper",mustWork=TRUE))

if(class(pathToData) != "try-error"){
## Make sure the data were found before proceeding

## Read in the data
## Note, the files here are compressed,
##  but yours do not need to be
testCountData <- mergeCountFiles(paste(pathToData,"/data/",sep=""),".genes.results.txt.gz")

## Display the contents
head(testCountData)

}  
  
## Not run: 
##D     ## On your data, it will look more like:
##D     mergedCountData <- mergeCountFiles("/path/to/countData")
##D     head(mergedCountData)    
##D   
## End(Not run) 



