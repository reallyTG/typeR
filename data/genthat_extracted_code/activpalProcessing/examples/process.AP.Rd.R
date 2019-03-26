library(activpalProcessing)


### Name: process.AP
### Title: Process AP Data
### Aliases: process.AP
### Keywords: loop process

### ** Examples

## Not run: 
##D 
##D #	identify working directory
##D directory <- identifyDirectory("/Users/jsmith/Documents/InterventionStudy/")
##D 
##D #	load example logs and export a tempaltes to working directory
##D data("log.subjects",package="activpalProcessing")
##D data("log.bed",package="activpalProcessing")
##D data("log.on.off",package="activpalProcessing")
##D 
##D write.table(log.subjects,file=paste(directory,"temp.log.subjects.csv",sep=""),sep=",",row.names=F)
##D write.table(log.bed,file=paste(directory,"temp.log.bed.csv",sep=""),sep=",",row.names=F)
##D write.table(log.on.off,file=paste(directory,"temp.log.on.off.csv",sep=""),sep=",",row.names=F)
##D 
##D #	process AP events files saved in directory 		
##D process.AP(directory=directory, name.of.log.subjects, name.of.log.bed, name.of.log.on.off)
## End(Not run)



