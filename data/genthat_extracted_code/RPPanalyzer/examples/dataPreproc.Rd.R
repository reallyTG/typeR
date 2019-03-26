library(RPPanalyzer)


### Name: dataPreproc
### Title: Data preprocessing
### Aliases: dataPreproc

### ** Examples

## Not run: 
##D library(RPPanalyzer)
##D 
##D 
##D 
##D # get output list 
##D dataDir<-system.file("extdata",package="RPPanalyzer")
##D res<-dataPreproc(dataDir=dataDir,blocks=12,spot="aushon",exportNo=4,correct="both")
##D 
##D # get individual elements
##D # raw data
##D rawdat<-res$rawdat
##D # dilution intercept corrected data
##D cordat<-res$cordat
##D # dilution intercept corrected and FCF normalized data
##D normdat<-res$normdat
##D # output directory
##D DIR<-res$DIR
##D 
## End(Not run)



