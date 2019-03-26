library(RPPanalyzer)


### Name: logList
### Title: Logarithmize (log2) the first two RPPA list elements, i.e.
###   foreground and background signal intensities
### Aliases: logList

### ** Examples

## Not run: 
##D library(RPPanalyzer)
##D 
##D   
##D   
##D # input data
##D dataDir<-system.file("extdata",package="RPPanalyzer")
##D x<-dataPreproc(dataDir=dataDir, blocks=12, spot="aushon", exportNo=4)
##D x.norm<-x$normdat
##D 
##D # get log2 list 
##D x.log<-logList(x.norm)
##D 
## End(Not run)



